# frozen_string_literal: true

class BooleanValidator < BaseValidator

  CHECKS = {
    all: nil,
    false_only: %w[0 f false n no off],
    true_only: %w[1 t true y yes on]
  }.freeze

  def validate_each(record, attribute, value)
    assert_valid_check!
    super
  end

  private

  def assert_valid_check!
    assert_valid_option!(:check, CHECKS.keys)
  end

  def check
    options[:check] || :all
  end

  def error_message
    [options[:message] || I18n.t("errors.messages.boolean.#{check}")]
  end

  def valid_attr?
    checks = CHECKS[check] || [].concat(CHECKS[:false_only], CHECKS[:true_only])
    checks.include?(value.to_s.downcase)
  end

end
