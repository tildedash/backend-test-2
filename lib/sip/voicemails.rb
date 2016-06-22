require 'Sip'

module Sip::Voicemails

  def self.voicemail_url(params)
    params['RecordUrl']
  end

end