# frozen_string_literal: true

class UsernameValidator < ActiveModel::EachValidator

  REGEXP ||= /^[a-z0-9_-]{1,255}$/.freeze

end
