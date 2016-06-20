# == Schema Information
#
# No Table name
#
#
class Endpoint
  include ActiveModel::Model

  attr_accessor :alias, :sub_account, :endpoint_id, :resource_uri, :sip_contact, :sip_uri, :username

  def method_missing(method_sym, *arguments, &block)
    # prevent initialize error for accessors not defined here
    super unless method_sym.to_s.end_with?("=")
  end

end