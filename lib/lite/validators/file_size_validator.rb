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

  def validate_each(_record, _attribute, value)
    assert_valid_check!
    valid?(value)
  end

  private

  def assert_valid_check!
    assert_valid_option!(:check, CHECKS.keys)
  end

  def valid_attr?
    options.slice(*CHECKS.keys).each do |option, option_value|
      validate_check(option, option_value)
    end
  end







  def validate_check(option, option_value)
    return if valid_size?(value_byte_size(v), option, option_value)

    record.errors.add(attribute, "file_size_is_#{option}".to_sym)
  end

end
