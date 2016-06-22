require 'Sip'

module Sip::Response

  def self.forward_to_endpoints(caller_id, callbackUrl, actionUrl, numbers)
    response = Response.new()
    dial = response.addDial({ callerId: caller_id, callbackUrl: callbackUrl, action: actionUrl, timeout: 15  })
    numbers.each do |number|
      dial.addUser(number)
    end
    response.to_xml
  end

  def self.empty
    Response.new.to_xml
  end

  def self.voicemail(actionCallbackUrl)
    response = Response.new()
    params = {
        action: actionCallbackUrl
    }
    response.addSpeak("Please leave your message")
    response.addRecord(params)
    response.to_xml
  end

end