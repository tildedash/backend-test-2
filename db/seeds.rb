include Rails.application.routes.url_helpers

# Clear database
puts "Clear database…"
Call.destroy_all
CompanyNumber.destroy_all
UserNumber.destroy_all
User.destroy_all
puts "OK"

require 'Sip'

# Create the application to receive calls
puts "Create receiving calls application..."
application_data = Sip.new_application({
                      answer_url: incoming_calls_url(host: ENV['HOST'], protocol: ENV['PROTOCOL']),
                      app_name: "receiving-call-#{Random.rand(1000)}"
                    })
app_id = application_data.last["app_id"]
puts "OK"

# Delete all endpoints
puts "Delete all endpoints…"
Sip::Endpoints.clear
puts "OK"

# Create users
puts "Create users…"
%w(Jane Peter Luke).each do |username|
  user = User.create(name: username)
  endpoint = Sip::Endpoints.new({ username: username, password: '%-5.5s' % username, alias: username  })
  user_number = UserNumber.create(sip_endpoint: endpoint.sip_uri, user: user)
end
puts "OK"

# Create company numbers
puts "Create company numbers…"
%w(MainOffice Sales Support).each do |office_name|
  endpoint = Sip::Endpoints.new({ username: office_name, password: '%-5.5s' % office_name, alias: office_name, app_id: app_id })
  company_number = CompanyNumber.create(sip_endpoint: endpoint.sip_uri)
end
puts "OK"

# Create the caller endpoint
application_data = Sip.new_application({
                      answer_url: incoming_calls_url(host: ENV['HOST'], protocol: ENV['PROTOCOL']),
                      app_name: 'receiving-call'
                    })

endpoint = Sip::Endpoints.new({ username: 'caller', password: 'caller', alias: 'caller', app_id: ENV['DIRECT_DIAL_APP_ID'] })
puts "Your caller endpoint is the following: #{endpoint.sip_uri} (username/password/alias: caller)"