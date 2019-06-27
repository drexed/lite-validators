# frozen_string_literal: true

class IsbnValidator < BaseValidator

  private

  def valid_attr?(value)
    value = value.to_s.gsub(/-| /, '').downcase.chars
    [10, 13].include?(value.size) && value.all? { |chr| %w[0 1 2 3 4 5 6 7 8 9 0 x].include?(chr) }
  end

end
