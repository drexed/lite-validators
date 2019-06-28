# frozen_string_literal: true

require 'resolv'

class IpAddressValidator < BaseValidator

  REGEXP ||= {
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

  def protocol
    options[:protocol] || :any
  end

  def valid_attr?
    case protocol
    when :ipv4 then valid_regexp?(:ipv4, value)
    when :ipv6 then valid_regexp?(:ipv6, value)
    else valid_regexp?(:ipv4, value) || valid_regexp?(:ipv6, value)
    end
  end

  def valid_regexp?(key, value)
    value.to_s =~ REGEXP[key]
  end

end
