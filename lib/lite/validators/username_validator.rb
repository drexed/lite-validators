# frozen_string_literal: true

class UsernameValidator < BaseValidator

  REGEXP ||= /^[A-Za-z0-9._-]{1,255}$/.freeze

end
