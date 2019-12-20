# frozen_string_literal: true

class Base64Validator < BaseValidator

  # rubocop:disable Layout/LineLength
  REGEXP ||= /^(?:[A-Za-z0-9+$]{4})*(?:[A-Za-z0-9+$]{2}==|[A-Za-z0-9+$]{3}=|[A-Za-z0-9+$]{4})$/.freeze
  # rubocop:enable Layout/LineLength

end
