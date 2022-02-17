# frozen_string_literal: true

require 'uri' unless defined?(URI)

class UrlValidator < BaseValidator

  SCHEMES = %w[
    http https
  ].freeze

  def validate_each(record, attribute, value)
    assign_attr_readers(record, attribute, URI.parse(value.to_s))
    valid_attr?
  rescue URI::BadURIError, URI::InvalidURIError
    record.errors.add(attribute, *error_message)
  end

  private

  def error_message_for(option)
    options[:message] || I18n.t("errors.messages.url.#{option}")
  end

  # rubocop:disable Layout/LineLength, Metrics/AbcSize
  def valid_attr?
    raise URI::InvalidURIError if value.to_s.strip.empty?

    valid_uri? && valid_host? && valid_domain? && valid_scheme? && valid_root?
  end

  def valid_domain?
    return true unless options[:domain]

    value_downcased = value.host.to_s.downcase
    check = Array(options[:domain]).any? { |domain| value_downcased.end_with?(".#{domain.downcase}") }
    return true if check

    record.errors.add(attribute, error_message_for(:domain))
  end

  def valid_host?
    hosts = options[:include_host] || options[:exclude_host]
    return true unless hosts

    value_downcased = value.host.to_s.downcase
    check = options[:include_host] ? :any? : :none?
    check = Array(hosts).send(check) { |host| value_downcased.include?(host.to_s.downcase) }
    return true if check

    record.errors.add(attribute, error_message_for(:host))
  end

  def valid_root?
    return true unless options[:root_only]

    check = ['', '/'].include?(value.path) && value.query.blank? && value.fragment.blank?
    return true if check

    record.errors.add(attribute, error_message_for(:root))
  end

  def valid_scheme?
    return true unless options[:scheme]

    value_downcased = value.scheme.to_s.downcase
    schemes = options[:scheme] || SCHEMES
    check = Array(schemes).any? { |scheme| value_downcased == scheme.to_s.downcase }
    return true if check

    record.errors.add(attribute, error_message_for(:scheme))
  end

  def valid_uri?
    value.is_a?(URI::Generic)
  end
  # rubocop:enable Layout/LineLength, Metrics/AbcSize

end
