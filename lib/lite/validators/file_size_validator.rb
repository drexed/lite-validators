# frozen_string_literal: true

class FileSizeValidator < BaseValidator

  CHECKS ||= {
    in: :===,
    less_than: :<,
    less_than_or_equal_to: :<=,
    greater_than: :>,
    greater_than_or_equal_to: :>=,
    equal_to: :==,
    not_equal_to: :!=
  }.freeze

  def validate_each(record, attribute, value)
    assert_valid_checks!
    assign_attr_readers(record, attribute, value)
    valid?
  end

  private

  # rubocop:disable Metrics/LineLength, Style/GuardClause
  def assert_valid_checks!
    if checks.empty?
      raise ArgumentError, "Missing atleast one check of #{CHECKS.keys.map(&:inspect).join(', ')} attribute for comparison."
    else
      assert_valid_option!(:checks, CHECKS.keys)
    end
  end
  # rubocop:enable Metrics/LineLength, Style/GuardClause

  def checks
    options.keys & CHECKS.keys
  end

  def error_options(option_value)
    if option_value.is_a?(Range)
      { min: option_value.min, max: option_value.max }
    else
      { count: option_value }
    end
  end

  def valid_attr?
    options.slice(*CHECKS.keys).each do |option, option_value|
      validate_check(option, option_value)
    end
  end

  def valid_size?(size, option, option_value)
    return false if size.nil?

    if option_value.is_a?(Range)
      option_value.send(CHECKS[option], size)
    else
      size.send(CHECKS[option], option_value)
    end
  end

  def validate_check(option, option_value)
    size = value.respond_to?(:byte_size) ? value.byte_size : value.size
    return if valid_size?(size, option, option_value)

    record.errors.add(attribute, option || options[:message], error_options(option_value))
  end

end
