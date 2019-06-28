# frozen_string_literal: true

class SedolValidator < BaseValidator

  REGEXP ||= /^([A-Z0-9]{6})(\d{1})$/.freeze
  WEIGHTS ||= [
    1, 3, 1, 7, 3, 9, 1
  ].freeze

  private

  def valid_attr?
    valid_regexp? && valid_checksum?
  end

  def valid_checksum?
    total = 0
    digits = value.chars.map { |dgt| /[A-Z]/.match?(dgt) ? (dgt.ord - 55) : dgt.to_i }
    digits.each_with_index { |dgt, idx| total += (WEIGHTS[idx] * dgt) }
    (10 - total % 10) % 10
  end

end
