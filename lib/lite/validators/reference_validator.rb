# frozen_string_literal: true

class ReferenceValidator < BaseValidator

  REGEXP = /\A[+-]?\d+\z/

  private

  def valid?
    (valid_id? && valid_type?) || valid_object?
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
    association_type = options[:association] || attribute.to_s.chomp('_id')
    association_object = record.send(association_type)
    return true if association_object.present? && association_object.valid?

    record.errors.add(association_type, *error_message)
  end

  def valid_type?
    return true unless options[:polymorphic]

    association_type = "#{attribute.to_s.chomp('_id')}_type"
    record.send(association_type).present?
  end

end
