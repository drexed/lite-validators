# frozen_string_literal: true

require "resolv" unless defined?(Resolv)

class IpAddressValidator < BaseValidator

  REGEXP = {
    ipv4: Resolv::IPv4::Regex,
    ipv6: Resolv::IPv6::Regex
  }.freeze

  def validate_each(record, attribute, value)
    assert_valid_protocol!
    super
  end

  private

  def assert_valid_protocol!
    assert_valid_option!(:protocol, REGEXP.keys.push(:any))
  end

  def error_message_for(option)
    options[:message] || I18n.t("errors.messages.ip_address.#{option}")
  end

  def protocol
    options[:protocol] || :any
  end

  def valid?
    valid_format? && valid_address?
  end

  def valid_address?
    addresses = options[:include_address] || options[:exclude_address]
    return true unless addresses

    check = options[:include_address] ? :any? : :none?
    check = Array(addresses).public_send(check) { |address| value.include?(address.to_s) }
    return true if check

    record.errors.add(attribute, error_message_for(:address))
  end

  def valid_format?
    case protocol
    when :ipv4 then valid_regexp?(:ipv4)
    when :ipv6 then valid_regexp?(:ipv6)
    else valid_regexp?(:ipv4) || valid_regexp?(:ipv6)
    end
  end

  def valid_regexp?(key)
    value.to_s =~ REGEXP[key]
  end

end
