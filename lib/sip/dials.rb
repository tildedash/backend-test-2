module Sip::Dials
  def self.completed?(params)
    params['CallStatus'] === "completed"
  end

  def self.answer?(params)
    params['DialAction'] == 'answer'
  end

  def self.endpoint(params)
    params["DialBLegTo"]
  end

  def self.callUUID(params)
    params['CallUUID']
  end
end