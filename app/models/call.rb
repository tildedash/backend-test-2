# == Schema Information
#
# Table name: calls
#
#  id                :integer          not null, primary key
#  number            :string
#  name              :string
#  company_number_id :integer
#  user_number_id    :integer
#  uuid              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Call < ActiveRecord::Base
  belongs_to :company_number
  belongs_to :user_number

  has_one :voicemail
end
