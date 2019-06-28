# frozen_string_literal: true

class UuidValidator < BaseValidator

  VERSIONS ||= {
    any: %r{^[0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12}$}i,
    3 => %r{^[0-9A-F]{8}-[0-9A-F]{4}-3[0-9A-F]{3}-[0-9A-F]{4}-[0-9A-F]{12}$}i,
    4 => %r{^[0-9A-F]{8}-[0-9A-F]{4}-4[0-9A-F]{3}-[89AB][0-9A-F]{3}-[0-9A-F]{12}$}i,
    5 => %r{^[0-9A-F]{8}-[0-9A-F]{4}-5[0-9A-F]{3}-[89AB][0-9A-F]{3}-[0-9A-F]{12}$}i
  }.freeze

  def validate_each(record, attribute, value)
    validate_version!
    super
  end

  private

  def version
    options[:version] || :any
  end

  def valid_regexp?(value)
    if options.key?(:version)
      value.to_s =~ VERSIONS[version]
    else
      VERSIONS.any? { |_, regexp| value.to_s =~ regexp }
    end
  end

  def validate_version!
    return unless options.key?(:version)

    validate_option!(:version, VERSIONS.keys)
  end

end