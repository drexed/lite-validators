# frozen_string_literal: true

class EmailValidator < BaseValidator

  REGEXP ||= %r{\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z}i.freeze

  private

  def valid_attr?
    valid_regexp? && valid_domain?(value)
  end

  def valid_domain?(value)
    return true unless options.key?(:domain)

    [options[:domain]].flatten.any? { |domain| value.downcase.end_with?(".#{domain.downcase}") }
  end

end
