# frozen_string_literal: true

class ReferenceValidator < BaseValidator

  REGEXP = /\A[+-]?\d+\z/

  private

  def valid?
    valid_id? || valid_object?
  end

  def valid_id?
    if value.blank?
      false
    elsif !valid_regexp?
      record.errors.add(attribute, *error_message)
    else
      !value.to_i.negative?
    end
  end

  def valid_object?
    association_object = options[:association] || attribute.to_s.chomp('_id')
    record.send(association_object).present?
  end

end
