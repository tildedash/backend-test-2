# == Schema Information
#
# Table name: company_numbers
#
#  id           :integer          not null, primary key
#  sip_endpoint :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class CompanyNumber < ActiveRecord::Base
  has_many :calls
end
