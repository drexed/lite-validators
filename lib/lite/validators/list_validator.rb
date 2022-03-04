# frozen_string_literal: true

class ListValidator < BaseValidator

  def validate_each(record, attribute, value)
    assert_valid_all_or_any_or_none!
    assign_attr_readers(record, attribute, value)
    valid?
  end

  private

  def assert_valid_all_or_any_or_none!
    return if options.key?(:all) || options.key?(:any) || options.key?(:none)

    raise ArgumentError, 'Missing ":all", ":any" or ":none" attribute for comparison.'
  end

  def valid_attr?
    options.slice(:all, :any, :none).each do |option, option_value|
      validate_check(option, option_value)
    end
  end

  def valid_content_type?(option, option_value)
    Array(value).public_send("#{option}?") { |val| option_value.include?(val) }
  end

  def validate_check(option, option_value)
    return if valid_content_type?(option, option_value)

    record.errors.add(attribute, *error_message)
  end

end
