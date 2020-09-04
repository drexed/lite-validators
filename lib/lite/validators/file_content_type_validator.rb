# frozen_string_literal: true

class FileContentTypeValidator < BaseValidator

  def validate_each(record, attribute, value)
    assert_valid_include_or_exclude!
    assign_attr_readers(record, attribute, value)
    valid?
  end

  private

  def assert_valid_include_or_exclude!
    return if options.key?(:include) || options.key?(:exclude)

    raise ArgumentError, 'Missing ":include" or ":exclude" attribute for comparison.'
  end

  def valid_attr?
    options.slice(:include, :exclude).each do |option, option_value|
      validate_check(option, option_value)
    end
  end

  # rubocop:disable Style/CaseEquality
  def valid_content_type?(option, option_value)
    check = Array(option_value).any? { |type| type === value.content_type }
    option == :exclude ? !check : check
  end
  # rubocop:enable Style/CaseEquality

  def validate_check(option, option_value)
    return if valid_content_type?(option, option_value)

    record.errors.add(attribute, *error_message)
  end

end
