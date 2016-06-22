module Sip::Call

  def self.attributes(params)
    {
      number: params['From'],
      name: params['CallerName'],
      to: params['To'],
      uuid: params['CallUUID']
    }
  end
end