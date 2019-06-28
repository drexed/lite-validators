# frozen_string_literal: true

class Boolean; end # Implements pseudo-boolean class

class TypeValidator < BaseValidator

  def validate_each(record, attribute, value)
    validate_is!
    super
  end

  private

  def valid_attr?(value)
    if options[:is] == Boolean
      value.is_a?(TrueClass) || value.is_a?(FalseClass)
    else
      value.is_a?(options[:is])
    end
  end

  def validate_is!
    return if options.key?(:is)

    raise ArgumentError, 'ArgumentError: missing ":is" attribute for comparison.'
  end

end
