# frozen_string_literal: true

require 'resolv'

class IpAddressValidator < BaseValidator

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
    when :ipv4 then valid_ipv4_regexp?(value)
    when :ipv6 then valid_ipv6_regexp?(value)
    else valid_ipv4_regexp?(value) || valid_ipv6_regexp?(value)
    end
  end

  def valid_ipv4_regexp?(value)
    value.to_s =~ Resolv::IPv4::Regex
  end

  def valid_ipv6_regexp?(value)
    value.to_s =~ Resolv::IPv6::Regex
  end

  # rubocop:disable Metrics/LineLength
  def validate_protocol!
    protocols = %i[any ipv4 ipv6]
    return if protocols.include?(protocol)

    raise ArgumentError, "Unknown protocol: #{protocol.inspect}. Valid protocols are: #{protocols.map(&:inspect).join(', ')}"
  end
  # rubocop:enable Metrics/LineLength

end
