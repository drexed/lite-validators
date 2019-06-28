# frozen_string_literal: true

class UsernameValidator < BaseValidator

  REGEXP ||= %r{^[a-z0-9_-]{1,255}$}.freeze

end
