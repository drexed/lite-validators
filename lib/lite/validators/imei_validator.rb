# frozen_string_literal: true

class ImeiValidator < BaseValidator

  REGEXP = /\A[\d.:\-\s]+\z/i

  private

  def valid_attr?
    valid_regexp? && valid_checksum?
  end

  def valid_checksum?
    number = value.to_s.gsub(/\D/, '').reverse

    total = 0
    number.chars.each_with_index do |chr, idx|
      result = chr.to_i
      result *= 2 if idx.odd?
      result = (1 + (result - 10)) if result >= 10
      total += result
    end

    (total % 10).zero?
  end

end
