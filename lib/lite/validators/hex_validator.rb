# frozen_string_literal: true

class HexValidator < BaseValidator

  REGEXP = /^#?([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/

end
