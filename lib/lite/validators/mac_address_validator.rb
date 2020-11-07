# frozen_string_literal: true

class MacAddressValidator < BaseValidator

  REGEXP ||= [
    /^(\h{2}[-|.:\s]){5}\h{2}?$/i,
    /^(\h{4}[-|.:\s]){2}\h{4}?$/i,
    /^(\h{6}[-|.:\s])\h{6}?$/i,
    /^\h{12}?$/i
  ].freeze

  private

  def valid_regexp?
    REGEXP.any? { |regexp| value.to_s =~ regexp }
  end

end
