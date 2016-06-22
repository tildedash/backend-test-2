require 'Sip'

module Sip::Endpoints

  def self.all(params = {})
    data = Sip.client.get_endpoints
    endpoints = []
    data.last['objects'].each do |endpoint_data|
      endpoints << Endpoint.new(endpoint_data)
    end
    endpoints
  end

  def self.clear
    self.all.each do |endpoint|
      Sip.client.delete_endpoint(endpoint.attributes)
    end
  end

  def self.new(params)
    data = Sip.client.create_endpoint(params).last
    Endpoint.new(Sip.client.get_endpoint(data).last)
  end
end