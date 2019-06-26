# frozen_string_literal: true

class BaseValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    return if valid?(value.to_s)

    record.errors.add(attribute, *error_message)
  end

  private

  def error_message
    [options[:message] || :invalid]
  end

end
