# frozen_string_literal: true

# NOTE: Implements pseudo-boolean class
class Boolean; end

class TypeValidator < BaseValidator

  def validate_each(record, attribute, value)
    assert_valid_is_or_is_not!
    super
  end

  private

  def assert_valid_is_or_is_not!
    return if options.key?(:is) || options.key?(:is_not)

    raise ArgumentError, 'Missing ":is" or ":is_not" attribute for comparison.'
  end

  def is_or_is_not
    options[:is] || options[:is_not]
  end

  def valid_attr?
    return !valid_type? if options.key?(:is_not)

    valid_type?
  end

  def valid_type?
    if is_or_is_not == Boolean
      value.is_a?(TrueClass) || value.is_a?(FalseClass)
    else
      [*is_or_is_not].any? { |klass| value.is_a?(klass) }
    end
  end

end
