# frozen_string_literal: true

class EqualityValidator < BaseValidator

  OPERATORS ||= {
    less_than: :<,
    less_than_or_equal_to: :<=,
    greater_than: :>,
    greater_than_or_equal_to: :>=,
    equal_to: :==,
    not_equal_to: :!=
  }.freeze

  def validate_each(record, attribute, value)
    assign_attr_readers(record, attribute, value)

    assert_valid_to!
    assert_valid_operator!
    return if valid_length? && valid_attr?(record, value)

    record.errors.add(attribute, *message)
  end

  private

  def assert_valid_operator!
    assert_valid_option!(:operator, OPERATORS.keys)
  end

  def assert_valid_to!
    return if options.key?(:to)

    raise ArgumentError, 'ArgumentError: missing ":to" attribute for comparison.'
  end

  def operator
    options[:operator] || :equal_to
  end

  def valid_attr?(record, value)
    other = record.send(options[:to])
    value.send(OPERATORS[operator], other)
  end

end
