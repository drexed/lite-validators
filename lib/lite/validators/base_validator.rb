# frozen_string_literal: true

class BaseValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    return if valid?(value)

    record.errors.add(attribute, *message)
  end

  private

  def message
    [options[:message] || :invalid]
  end

  def valid?(value)
    valid_length?(value) && valid_attr?(value)
  end

  def valid_attr?(value)
    valid_regexp?(value)
  end

  def valid_length?(value)
    !value.to_s.strip.empty?
  end

  def valid_regexp?(value)
    value.to_s =~ self.class::REGEXP
  end

  # rubocop:disable Metrics/LineLength, Naming/UncommunicativeMethodParamName
  def validate_option!(name, collection, as: nil)
    option = send(as || name)
    return if collection.include?(option)

    raise ArgumentError, "Unknown #{name}: #{option.inspect}. Valid options are: #{collection.map(&:inspect).join(', ')}"
  end
  # rubocop:enable Metrics/LineLength, Naming/UncommunicativeMethodParamName

end
