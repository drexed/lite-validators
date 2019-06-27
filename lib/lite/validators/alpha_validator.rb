# frozen_string_literal: true

class AlphaValidator < BaseValidator

  CASES ||= {
    lower: 'a-z',
    upper: 'A-Z',
    any: 'A-Za-z'
  }.freeze

  def validate_each(record, attribute, value)
    validate_case!
    super
  end

  private

  def kase
    options[:case] || :any
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
    /^[#{CASES[kase]}#{' ' if options[:allow_space]}]+$/
  end

  def valid_regexp?(value)
    value.to_s =~ regexp
  end

  def validate_case!
    validate_option!(:case, CASES.keys, as: :kase)
  end

end
