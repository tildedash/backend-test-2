require 'plivo'
include Plivo

module Sip

  ############ API client ###########

  def self.api_client
    RestAPI.new(ENV['PLIVO_AUTH_ID'], ENV['PLIVO_AUTH_TOKEN'])
  end

  ############ endpoints ############

  def self.endpoints(params = {})
    data = api_client.get_endpoints
    endpoints = []
    data.last['objects'].each do |endpoint_data|
      endpoints << Endpoint.new(endpoint_data)
    end
    endpoints
  end

end