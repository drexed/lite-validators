# frozen_string_literal: true

class CompareValidator < BaseValidator

  CHECKS ||= {
    less_than: :<,
    less_than_or_equal_to: :<=,
    greater_than: :>,
    greater_than_or_equal_to: :>=,
    equal_to: :==,
    not_equal_to: :!=
  }.freeze

  def validate_each(record, attribute, value)
    assert_valid_to!
    assert_valid_check!
    super
  end

  private

  def assert_valid_check!
    assert_valid_option!(:check, CHECKS.keys)
  end

  def assert_valid_to!
    return if options.key?(:to)

    raise ArgumentError, 'Missing ":to" attribute for comparison.'
  end

  def check
    options[:check] || :equal_to
  end

  def valid_attr?
    other = record.send(options[:to])
    value.send(CHECKS[check], other)
  end

end
