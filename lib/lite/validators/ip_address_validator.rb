# frozen_string_literal: true

require 'resolv'

class IpAddressValidator < BaseValidator

  REGEXP ||= {
    ipv4: Resolv::IPv4::Regex,
    ipv6: Resolv::IPv6::Regex
  }.freeze

  def validate_each(record, attribute, value)
    validate_protocol!
    super
  end

  private

  def protocol
    options[:protocol] || :any
  end

  def valid_attr?(value)
    case protocol
    when :ipv4 then valid_regexp?(:ipv4, value)
    when :ipv6 then valid_regexp?(:ipv6, value)
    else valid_regexp?(:ipv4, value) || valid_regexp?(:ipv6, value)
    end
  end

  def valid_regexp?(key, value)
    value.to_s =~ REGEXP[key]
  end

  def validate_protocol!
    validate_option!(:protocol, REGEXP.keys.push(:any))
  end

end
