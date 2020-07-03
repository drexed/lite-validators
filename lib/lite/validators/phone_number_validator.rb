# frozen_string_literal: true

class PhoneNumberValidator < BaseValidator

  REGEXP ||= %r{^[0-9+()#.\s/ext-]+$}.freeze

end
