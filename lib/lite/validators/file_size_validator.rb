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
    assert_valid_check!
    valid?(value)
  end

  private

  # Validator specific

  def assert_valid_check!
    assert_valid_option!(:check, CHECKS.keys)
  end

  def valid_attr?(value)
    options.slice(*CHECKS.keys).each do |option, option_value|
      check_errors(record, attribute, values, option, option_value)
    end
  end

end
