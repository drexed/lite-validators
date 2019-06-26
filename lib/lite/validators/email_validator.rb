# frozen_string_literal: true

class EmailValidator < BaseValidator

  REGEXP ||= /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i.freeze

  private

  def valid_attr?(value)
    valid_regexp?(value) && valid_domain?(value)
  end

  def valid_domain?(value)
    return true unless options.key?(:domain)

    [options[:domain]].flatten.any? { |domain| value.downcase.end_with?(".#{domain.downcase}") }
  end

end
