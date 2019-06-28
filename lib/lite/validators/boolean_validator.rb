# frozen_string_literal: true

class BooleanValidator < BaseValidator

  FALSE_VALUES ||= [
    false, 0, '0', 'f', 'F', 'false', 'FALSE'
  ].freeze
  TRUE_VALUES ||= [
    true, 1, '1', 't', 'T', 'true', 'TRUE'
  ].freeze

  private

  def valid_attr?
    TRUE_VALUES.include?(value) || FALSE_VALUES.include?(value)
  end

end
