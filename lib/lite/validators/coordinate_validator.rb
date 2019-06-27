# frozen_string_literal: true

class CoordinateValidator < BaseValidator

  def validate_each(record, attribute, value)
    validate_boundary!
    super
  end

  private

  def valid_attr?(value)
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

  # rubocop:disable Metrics/LineLength
  def validate_boundary!
    return unless options.key?(:boundary)

    boundaries = %i[pair latitude longitude]
    boundary = options[:boundary]
    return if boundaries.include?(boundary)

    raise ArgumentError, "Unknown boundary: #{boundary.inspect}. Valid boundaries are: #{boundaries.map(&:inspect).join(', ')}"
  end
  # rubocop:enable Metrics/LineLength

end
