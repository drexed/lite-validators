# frozen_string_literal: true

class PasswordValidator < BaseValidator

  REGEXP ||= {
    strong: /\A(?=.{4,255})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]])/x,
    weak: /^[A-Za-z0-9.,<>:;!@#$%^&*?_~-]{1,255}$/
  }.freeze

  def validate_each(record, attribute, value)
    validate_strength!
    super
  end

  private

  def strength
    options[:strength] || :weak
  end

  def valid_regexp?(value)
    value.to_s =~ REGEXP[strength]
  end

  def validate_strength!
    validate_option!(:strength, REGEXP.keys)
  end

end
