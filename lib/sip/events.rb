require 'Sip'

module Sip::Events

  def self.ringing?(params)
    params['CallStatus'] === "ringing"
  end
end