# frozen_string_literal: true

class NameValidator < BaseValidator

  REGEXP = /^([A-Za-z0-9'-]+\s+){1,4}[A-Za-z0-9'-]*\z/

end
