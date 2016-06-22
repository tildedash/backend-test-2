require 'plivo'
include Plivo

module Sip

  def self.client
    RestAPI.new(ENV['PLIVO_AUTH_ID'], ENV['PLIVO_AUTH_TOKEN'])
  end
end