# frozen_string_literal: true

class AlphaValidator < BaseValidator

  REGEXP ||= {
    'any_with_space' => /^[A-Za-z ]+$/,
    'any_without_space' => /^[A-Za-z]+$/,
    'lower_with_space' => /^[a-z ]+$/,
    'lower_without_space' => /^[a-z]+$/,
    'upper_with_space' => /^[A-Z ]+$/,
    'upper_without_space' => /^[A-Z]+$/
  }.freeze

  def validate_each(record, attribute, value)
    validate_case!
    super
  end

  private

  def kase
    options[:case] || :any
  end

  def key
    "#{kase}_with#{:out unless options[:allow_space]}_space"
  end

  def message
    [
      options[:message] || [:invalid, valid_attr: message_format]
    ].flatten
  end

  def message_format
    return 'unknown' if regexp.nil?

    regexp.to_s.split('[').last.split(']').first
  end

  def regexp
    REGEXP[key]
  end

  def valid_regexp?(value)
    value.to_s =~ regexp
  end

  # rubocop:disable Metrics/LineLength
  def validate_case!
    kases = %i[any lower upper]
    return if kases.include?(kase)

    raise ArgumentError, "Unknown case: #{kase.inspect}. Valid cases are: #{kases.map(&:inspect).join(', ')}"
  end
  # rubocop:enable Metrics/LineLength

end
