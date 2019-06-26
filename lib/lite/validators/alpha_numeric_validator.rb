# frozen_string_literal: true

class AlphaNumericValidator < BaseValidator

  private

  def error_message
    [options[:message] || [:invalid, valid_format: format_regexp]].flatten
  end

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
    value =~ /#{regexp}/
  end

  def valid_length?(value)
    !value.empty?
  end

end
