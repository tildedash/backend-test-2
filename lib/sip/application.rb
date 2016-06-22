module Sip::Application
  def self.new(params)
    Sip.client.create_application(params)
  end
end