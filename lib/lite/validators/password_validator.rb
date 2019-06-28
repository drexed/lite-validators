# frozen_string_literal: true

class PasswordValidator < BaseValidator

  REGEXP ||= {
    strong: /\A(?=.{4,255})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]])/x,
    weak: /^[A-Za-z0-9.,<>:;!@#$%^&*?_~-]{1,255}$/
  }.freeze

  def validate_each(record, attribute, value)
    assert_valid_strength!
    super
  end

  private

  def assert_valid_strength!
    assert_valid_option!(:strength, REGEXP.keys)
  end

  def strength
    options[:strength] || :weak
  end

  def valid_regexp?
    value.to_s =~ REGEXP[strength]
  end

end
