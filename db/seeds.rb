# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Clear database
CompanyNumber.destroy_all
UserNumber.destroy_all
User.destroy_all

# Create users
%w(Jane Peter Luke).each do |username|
  User.create(name: username)
end

# Create company numbers
%w(MainOffice Sales Support).each do |company_number|
  CompanyNumber.create(sip_endpoint: company_number)
end

# Create User numbers
