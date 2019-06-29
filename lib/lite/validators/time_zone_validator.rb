# frozen_string_literal: true

require 'active_support/core_ext/time/zones'

class TimeZoneValidator < BaseValidator

  private

  def valid_attr?
    !ActiveSupport::TimeZone[value].nil?
  end

end
