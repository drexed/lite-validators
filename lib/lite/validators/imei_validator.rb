# frozen_string_literal: true

class ImeiValidator < BaseValidator

  REGEXP ||= %r{\A[\d\.\:\-\s]+\z}i.freeze

  private

  def valid_attr?(value)
    valid_regexp?(value) && valid_checksum?(value)
  end

  def valid_checksum?(value)
    number = value.to_s.gsub(%r{\D}, '').reverse

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
