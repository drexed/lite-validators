# frozen_string_literal: true

class CusipValidator < BaseValidator

  REGEXP = /^[0-9A-Z]{9}$/

  private

  def valid_attr?
    valid_regexp? && valid_checksum?
  end

  def valid_checksum?
    digits = value.chars.map { |chr| /[A-Z]/.match?(chr) ? (chr.ord - 55) : chr.to_i }

    even_values = digits.values_at(*digits.each_index.select(&:even?))
    odd_values = digits.values_at(*digits.each_index.select(&:odd?))

    values = odd_values.map { |int| int * 2 }.zip(even_values).flatten
    values = values.inject(0) { |sum, int| sum + (int / 10) + (int % 10) }

    ((10 - values) % 10) % 10
  end

end
