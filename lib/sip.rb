require 'plivo'
include Plivo

module Sip

  require 'Sip/Application'
  require 'Sip/Call'
  require 'Sip/Dials'
  require 'Sip/Endpoints'
  require 'Sip/Events'
  require 'Sip/Response'
  require 'Sip/Voicemails'

  def self.client
    RestAPI.new(ENV['PLIVO_AUTH_ID'], ENV['PLIVO_AUTH_TOKEN'])
  end
end