# frozen_string_literal: true

class CurrencyValidator < BaseValidator

  REGEXP ||= /^\d*+(\.\d{1,2})$/.freeze

end
