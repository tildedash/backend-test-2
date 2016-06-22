require 'plivo'
include Plivo

module Sip

  require 'Sip/Response'
  require 'Sip/Endpoints'

  ############ API client ###########

  def self.client
    RestAPI.new(ENV['PLIVO_AUTH_ID'], ENV['PLIVO_AUTH_TOKEN'])
  end

  ############ application ##########

  def self.new_application(params)
    client.create_application(params)
  end

  ########### webhooks ###############

  def self.extract_call(data)
    {
      number: data['From'],
      name: data['CallerName'],
      to: data['To'],
      uuid: data['CallUUID']
    }
  end

  ####### hangup ############

  def self.normal_clearing?(params)
    params["HangupCause"] === "NORMAL_CLEARING"
  end

  def self.no_answer?(params)
    params["HangupCause"] === "NO_ANSWER"
  end

  def self.completed?(params)
    params['CallStatus'] === "completed"
  end

  def self.ringing?(params)
    params['CallStatus'] === "ringing"
  end

  ####### call ###############

  def self.extract_callUUID(params)
    params['CallUUID']
  end

  def self.dial_endpoint(params)
    params["DialBLegTo"]
  end

  def self.answer?(params)
    params['DialAction'] == 'answer'
  end

  ####### voicemail ##########

  def self.voicemail_url(params)
    params['RecordUrl']
  end
end