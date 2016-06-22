# == Schema Information
#
# Table name: voicemails
#
#  id         :integer          not null, primary key
#  url        :string
#  call_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class VoicemailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
