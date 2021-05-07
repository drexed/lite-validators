# frozen_string_literal: true

class CoordinateValidator < BaseValidator

  BOUNDARIES = {
    latitude: 90.0,
    longitude: 180.0
  }.freeze

  def validate_each(record, attribute, value)
    assert_valid_boundary!
    super
  end

  private

  def assert_valid_boundary!
    assert_valid_option!(:boundary, BOUNDARIES.keys.push(:pair))
  end

  def boundary
    options[:boundary] || :pair
  end

  def valid_attr?
    case boundary
    when :latitude then valid_boundary?(:latitude)
    when :longitude then valid_boundary?(:longitude)
    else valid_boundary?(:latitude, value.first) && valid_boundary?(:longitude, value.last)
    end
  end

  def valid_boundary?(key, coordinate = nil)
    (coordinate || value).to_f.abs <= BOUNDARIES[key]
  end

end
