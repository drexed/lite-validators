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
    validate_check!
    valid?(value)
  end

  private

  # Base specific


  # Validator specific

  def valid_attr?(value)
    options.slice(*CHECKS.keys).each do |option, option_value|
      check_errors(record, attribute, values, option, option_value)
    end
  end

  def validate_check(record, attribute, values, option, option_value)

  end

  def validate_check!
    validate_option!(:check, CHECKS.keys)
  end

end
