# frozen_string_literal: true

class NameValidator < BaseValidator

  REGEXP = /^([A-Za-z'"-]+\s+){1,4}[A-Za-z'"-]*\z/.freeze

end
