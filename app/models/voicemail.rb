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

class Voicemail < ActiveRecord::Base
  belongs_to :call
end
