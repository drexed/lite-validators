# frozen_string_literal: true

class BooleanValidator < BaseValidator

  VALUES ||= %w[
    1 0 t f true false y n yes no on off
  ].freeze

  private

  def valid_attr?
    VALUES.include?(value.to_s.downcase)
  end

end
