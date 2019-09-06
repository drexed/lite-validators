# frozen_string_literal: true

require 'uri'

class UrlValidator < BaseValidator

  SCHEMES ||= %w[
    http https
  ].freeze

  def validate_each(record, attribute, value)
    assign_attr_readers(record, attribute, URI.parse(value.to_s))
    valid_attr?
  rescue URI::InvalidURIError
    record.errors.add(attribute, *error_message)
  end

  private

  def scheme
    options[:scheme] || UrlValidator::SCHEMES
  end

  def error_message_for(option)
    options[:message] || I18n.t("errors.messages.url.#{option}")
  end

  def valid_attr?
    raise URI::InvalidURIError if value.to_s.strip.empty?

    valid_uri? && valid_domain? && valid_scheme? && valid_root?
  end

  # rubocop:disable Metrics/AbcSize
  def valid_domain?
    return true unless options[:domain]

    value_downcased = value.host.to_s.downcase
    check = [*options[:domain]].any? { |domain| value_downcased.end_with?(".#{domain.downcase}") }
    record.errors.add(attribute, error_message_for(:domain)) unless check
  end

  def valid_root?
    return true unless options[:root_only]

    check = ['', '/'].include?(value.path) && value.query.blank? && value.fragment.blank?
    record.errors.add(attribute, error_message_for(:root)) unless check
  end

  def valid_scheme?
    return true unless options[:scheme]

    value_downcased = value.scheme.to_s.downcase
    check = [*scheme].any? { |sch| value_downcased == sch.to_s.downcase }
    record.errors.add(attribute, error_message_for(:scheme)) unless check
  end
  # rubocop:enable Metrics/AbcSize

  def valid_uri?
    value.is_a?(URI::Generic)
  end

end
