# frozen_string_literal: true

class AlphaNumericValidator < AlphaValidator

  private

  def regexp
    /^[#{CASES[kase]}0-9#{' ' if options[:allow_space]}]+$/
  end

end
