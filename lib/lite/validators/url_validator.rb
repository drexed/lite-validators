# frozen_string_literal: true

require 'uri'

class UrlValidator < BaseValidator

  SCHEMES ||= %i[
    http https
  ].freeze

  def validate_each(record, attribute, value)
    assign_attr_readers(record, attribute, URI.parse(value.to_s))
    raise URI::InvalidURIError unless valid?
  rescue URI::InvalidURIError
    record.errors.add(attribute, *message)
  end

  private

  def scheme
    options[:scheme] || UrlValidator::SCHEMES
  end

  def valid_attr?
    valid_uri?(value) && valid_domain?(value) && valid_scheme?(value) && valid_root?(value)
  end

  def valid_domain?(value)
    return true unless options[:domain]

    value_downcased = value.host.to_s.downcase
    [*options[:domain]].any? { |domain| value_downcased.end_with?(".#{domain.downcase}") }
  end

  def valid_root?(value)
    return true unless options[:root_only]

    ['', '/'].include?(value.path) && value.query.blank? && value.fragment.blank?
  end

  def valid_scheme?(value)
    return true unless options[:scheme]

    value_downcased = value.scheme.to_s.downcase
    [*scheme].any? { |sch| value_downcased == sch.to_s.downcase }
  end

  def valid_uri?(value)
    value.is_a?(URI::Generic)
  end

end
