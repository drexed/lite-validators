# frozen_string_literal: true

class PhoneNumberValidator < BaseValidator

  REGEXP ||= /^[0-9+\(\)#\.\s\/ext-]+$/.freeze

end
