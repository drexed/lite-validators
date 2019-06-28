# frozen_string_literal: true

class MacAddressValidator < BaseValidator

  REGEXP ||= [
    %r{^([\h]{2}[-|\.:|\s]){5}[\h]{2}?$}i,
    %r{^([\h]{4}[-|\.:|\s]){2}[\h]{4}?$}i,
    %r{^([\h]{6}[-|\.:|\s])[\h]{6}?$}i,
    %r{^[\h]{12}?$}i
  ].freeze

  private

  def valid_regexp?(value)
    REGEXP.any? { |regexp| value.to_s =~ regexp }
  end

end
