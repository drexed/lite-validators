# frozen_string_literal: true

class AlphaValidator < BaseValidator

  CASES ||= {
    lower: 'a-z',
    upper: 'A-Z',
    any: 'A-Za-z'
  }.freeze

  def validate_each(record, attribute, value)
    assert_valid_case!
    super
  end

  private

  def assert_valid_case!
    assert_valid_option!(:case, CASES.keys, option: kase)
  end

  def kase
    options[:case] || :any
  end

  def regexp
    /^[#{CASES[kase]}#{' ' if options[:allow_space]}]+$/
  end

  def valid_regexp?
    value.to_s =~ regexp
  end

end
