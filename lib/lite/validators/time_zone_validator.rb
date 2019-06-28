# frozen_string_literal: true

class TimeZoneValidator < BaseValidator

  def validate_each(record, attribute, value)
    assert_valid_active_support!
    super
  end

  private

  def assert_valid_active_support!
    return if defined?(ActiveSupport::TimeZone)

    raise 'RuntimeError: ActiveSupport::TimeZone must be loaded.'
  end

  def valid_attr?(value)
    !ActiveSupport::TimeZone[value].nil?
  end

end
