# frozen_string_literal: true

class BaseValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    return if valid?(value.to_s)

    record.errors.add(attribute, *message)
  end

  private

  def message
    [options[:message] || :invalid]
  end

  def valid?(value)
    valid_length?(value) && valid_format?(value)
  end

  def valid_format?(value)
    value =~ self.class::REGEXP
  end

  def valid_length?(value)
    !value.strip.empty?
  end

end
