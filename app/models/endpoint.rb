# == Schema Information
#
# No Table name
#
#
class Endpoint
  include ActiveModel::Model

  ATTRS = %i(alias sub_account endpoint_id resource_uri sip_contact sip_uri username)
  attr_accessor(*ATTRS)

  def method_missing(method_sym, *arguments, &block)
    # prevent initialize error for accessors not defined here
    super unless method_sym.to_s.end_with?("=")
  end

  def attributes
    self.as_json
  end

  def self.attributes
    ATTRS
  end

  def self.create_attributes
    %i(username password alias)
  end

end