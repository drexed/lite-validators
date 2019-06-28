# frozen_string_literal: true

class IsbnValidator < BaseValidator

  CHARACTERS ||= %w[
    0 1 2 3 4 5 6 7 8 9 0 x
  ].freeze

  private

  def valid_attr?(value)
    value = value.to_s.gsub(/-| /, '').downcase.chars
    [10, 13].include?(value.size) && value.all? { |chr| CHARACTERS.include?(chr) }
  end

end
