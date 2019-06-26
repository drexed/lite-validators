# frozen_string_literal: true

class CusipValidator < BaseValidator

  REGEXP ||= /^[0-9A-Z]{9}$/.freeze

  private

  # rubocop:disable Metrics/AbcSize
  def valid_checksum?(value)
    digits = value.chars.map { |chr| /[A-Z]/.match?(chr) ? (chr.ord - 55) : chr.to_i }
    even_values = digits.values_at(*digits.each_index.select(&:even?))
    odd_values = digits.values_at(*digits.each_index.select(&:odd?))
    values = odd_values.map { |int| int * 2 }.zip(even_values).flatten
    values = values.inject(0) { |sum, int| sum + (int / 10) + int % 10 }
    ((10 - values) % 10) % 10
  end
  # rubocop:enable Metrics/AbcSize

  def valid_attr?(value)
    valid_regexp?(value) && valid_checksum?(value)
  end

end
