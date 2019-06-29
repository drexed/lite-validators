# frozen_string_literal: true

# NOTE: Implements pseudo-boolean class
class Boolean; end

class TypeValidator < BaseValidator

  def validate_each(record, attribute, value)
    assert_valid_is!
    super
  end

  private

  def assert_valid_is!
    return if options.key?(:is)

    raise ArgumentError, 'Missing ":is" attribute for comparison.'
  end

  def valid_attr?
    return !valid_type? if options[:not]

    valid_type?
  end

  def valid_type?
    if options[:is] == Boolean
      value.is_a?(TrueClass) || value.is_a?(FalseClass)
    else
      [*options[:is]].any? { |klass| value.is_a?(klass) }
    end
  end

end
