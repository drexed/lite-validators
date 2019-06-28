# frozen_string_literal: true

class BooleanValidator < BaseValidator

  VALUES ||= [
    '1', '0', 't', 'f', 'true', 'false'
  ].freeze

  private

  def valid_attr?
    VALUES.include?(value.to_s.downcase)
  end

end
