# frozen_string_literal: true

class AlphaNumericValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    return if valid?(value.to_s)

    record.errors.add(attribute, :invalid, valid_format: format_regexp)
  end

  private

  def format_regexp
    regexp = case options[:case].to_s
             when 'lower' then 'a-z0-9'
             when 'upper' then 'A-Z0-9'
             else 'A-Za-z0-9'
             end

    "#{regexp}#{' ' if options[:allow_space]}"
  end

  def valid?(value)
    valid_length?(value) && valid_format?(value)
  end

  def valid_format?(value)
    regexp = "^[#{format_regexp}]+$"
    value =~ %r[#{regexp}]
  end

  def valid_length?(value)
    !value.empty?
  end

end
