# frozen_string_literal: true

class HexValidator < BaseValidator

  REGEXP ||= %r{^#?([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$}.freeze

end
