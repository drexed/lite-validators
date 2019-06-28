# frozen_string_literal: true

class TimeZoneValidator < BaseValidator

  def validate_each(record, attribute, value)
    validate_active_support!
    super
  end

  private

  def valid_attr?(value)
    !ActiveSupport::TimeZone[value].nil?
  end

  def validate_active_support!
    return if defined?(ActiveSupport::TimeZone)

    raise 'RuntimeError: ActiveSupport::TimeZone must be loaded.'
  end

end
