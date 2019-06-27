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
    validate_to!
    validate_operator!
    return if valid_length?(value) && valid_attr?(record, value)

    record.errors.add(attribute, *message)
  end

  private

  def operator
    options[:operator] || :equal_to
  end

  def valid_attr?(record, value)
    other = record.send(options[:to])
    value.send(OPERATORS[operator], other)
  end

  # rubocop:disable Metrics/LineLength
  def validate_operator!
    operators = OPERATORS.keys
    return if operators.include?(operator)

    raise ArgumentError, "Unknown operator: #{operator.inspect}. Valid operators are: #{operators.map(&:inspect).join(', ')}"
  end
  # rubocop:enable Metrics/LineLength

  def validate_to!
    return if options.key?(:to)

    raise ArgumentError, 'ArgumentError: missing ":to" attribute for comparison.'
  end

end