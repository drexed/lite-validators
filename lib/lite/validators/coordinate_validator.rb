# frozen_string_literal: true

class CoordinateValidator < BaseValidator

  private

  def valid_format?(value)
    case options[:boundary].to_s
    when 'latitude' then valid_latitude?(value)
    when 'longitude' then valid_longitude?(value)
    else valid_latitude?(value.first) && valid_longitude?(value.last)
    end
  end

  def valid_latitude?(value)
    value.to_f.abs <= 90.0
  end

  def valid_longitude?(value)
    value.to_f.abs <= 180.0
  end

end
