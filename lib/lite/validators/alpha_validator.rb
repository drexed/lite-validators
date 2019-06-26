# frozen_string_literal: true

class AlphaValidator < AlphaNumericValidator

  private

  def format_regexp
    regexp = case options[:case].to_s
             when 'lower' then 'a-z'
             when 'upper' then 'A-Z'
             else 'A-Za-z'
             end

    "#{regexp}#{' ' if options[:allow_space]}"
  end

end
