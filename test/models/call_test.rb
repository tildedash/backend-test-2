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

require 'test_helper'

class CallTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
