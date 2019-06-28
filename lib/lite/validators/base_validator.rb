# frozen_string_literal: true

class BaseValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    assign_attr_readers(record, attribute, value)
    return if valid?

    record.errors.add(attribute, *error_message)
  end

  private

  attr_reader :record, :attribute, :value

  def assign_attr_readers(record, attribute, value)
    @record = record
    @attribute = attribute
    @value = value
  end

  # rubocop:disable Metrics/LineLength, Naming/UncommunicativeMethodParamName
  def assert_valid_option!(name, collection, as: nil)
    option = send(as || name)
    return if collection.include?(option)

    raise ArgumentError, "Unknown #{name}: #{option.inspect}. Valid options are: #{collection.map(&:inspect).join(', ')}"
  end
  # rubocop:enable Metrics/LineLength, Naming/UncommunicativeMethodParamName

  def error_message
    [options[:message] || :invalid]
  end

  def valid?
    valid_length? && valid_attr?
  end

  def valid_attr?
    valid_regexp?
  end

  def valid_length?
    !value.to_s.strip.empty?
  end

  def valid_regexp?
    value.to_s =~ self.class::REGEXP
  end

end
