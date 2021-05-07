# frozen_string_literal: true

class EmailValidator < BaseValidator

  REGEXP ||= /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i.freeze

  private

  def valid_attr?
    valid_regexp? && valid_domain?
  end

  def valid_domain?
    return true unless options.key?(:domain)

    Array(options[:domain]).any? { |domain| value.downcase.end_with?(".#{domain.downcase}") }
  end

end
