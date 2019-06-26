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

  private

  def key
    "#{options[:case] || :any}_with#{:out unless options[:allow_space]}_space"
  end

  def message
    [
      options[:message] || [:invalid, valid_format: message_format]
    ].flatten
  end

  def message_format
    regexp.to_s.split('[').last.split(']').first
  end

  def regexp
    REGEXP[key]
  end

  def valid_format?(value)
    value.to_s =~ regexp
  end

end
