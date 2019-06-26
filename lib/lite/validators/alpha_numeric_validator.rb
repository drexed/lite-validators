# frozen_string_literal: true

class AlphaNumericValidator < AlphaValidator

  REGEXP = {
    'any_with_space' => /^[A-Za-z0-9 ]+$/,
    'any_without_space' => /^[A-Za-z0-9]+$/,
    'lower_with_space' => /^[a-z0-9 ]+$/,
    'lower_without_space' => /^[a-z0-9]+$/,
    'upper_with_space' => /^[A-Z0-9 ]+$/,
    'upper_without_space' => /^[A-Z0-9]+$/
  }.freeze

  private

  def regexp
    REGEXP[key]
  end

end
