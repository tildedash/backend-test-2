require 'Sip'

class CallsController < ApplicationController

  skip_before_filter :verify_authenticity_token

  # webhook when an endpoint receives a call.
  def incoming
    if Sip::Events.ringing?(params)
      call_params = Sip::Call.attributes(params)
      company_number = CompanyNumber.find_by(sip_endpoint: call_params[:to])

      if company_number
        Call.create!({
            number: call_params[:number],
            company_number: company_number,
            uuid: call_params[:uuid],
            name: call_params[:name]
          })

        response = Sip::Response.forward_to_endpoints(
                                                    call_params[:number],
                                                    Rails.application.routes.url_helpers.dialcallback_calls_url(host: ENV['HOST'], protocol: ENV['PROTOCOL']),
                                                    Rails.application.routes.url_helpers.dialaction_calls_url(host: ENV['HOST'], protocol: ENV['PROTOCOL']),
                                                    UserNumber.all.map(&:sip_endpoint))
      end
    end

    respond_to do |format|
      format.xml { render xml: response || Sip::Response.empty }
    end
  end

  # wehbhook when a call to an endpoint is completed.
  def hangup
    respond_to do |format|
      format.xml { render xml: Sip::Response.empty }
    end
  end

  # Redirect to this URL after recording voicemail
  def record
    voicemail = Voicemail.create!({
          url: Sip::Voicemails.voicemail_url(params),
          call: Call.find_by(uuid: Sip::Dials.callUUID(params))
        })

    respond_to do |format|
      format.xml { render xml: Sip::Response.empty }
    end
  end

  # Redirect to this URL after leaving Dial.
  def dialaction
    unless Sip::Dials.completed?(params)
      response = Sip::Response.voicemail(Rails.application.routes.url_helpers.record_calls_url(host: ENV['HOST'], protocol: ENV['PROTOCOL']))
    end
    respond_to do |format|
      format.xml { render xml: response || Sip::Response.empty }
    end
  end

  # wehbhook when a call started.
  # URL that is notified by Plivo when one of the following events occur :
  # called party is bridged with caller
  # called party hangs up
  # caller has pressed any digit
  def dialcallback
    if Sip::Dials.answer?(params)
      call = Call.find_by!(uuid: Sip::Dials.callUUID(params))
      call.user_number = UserNumber.find_by!(sip_endpoint: Sip::Dials.endpoint(params))
      call.save
    end

    respond_to do |format|
      format.xml { render xml: Sip::Response.empty }
    end
  end
end