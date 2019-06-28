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

    raise ArgumentError, 'ArgumentError: missing ":is" attribute for comparison.'
  end

  def valid_attr?(value)
    return !valid_type?(value) if options[:not]

    valid_type?(value)
  end

  def valid_type?(value)
    if options[:is] == Boolean
      value.is_a?(TrueClass) || value.is_a?(FalseClass)
    else
      [*options[:is]].any? { |klass| value.is_a?(klass) }
    end
  end

end
