# frozen_string_literal: true

class SsnValidator < BaseValidator

  REGEXP = /^\A(\d{3}-\d{2}-\d{4}|\d{9})\Z$/

end
