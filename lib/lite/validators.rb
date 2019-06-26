# frozen_string_literal: true

require 'active_model'

# TODO:
# - csv_validator

%w[
  version base_validator alpha_validator alpha_numeric_validator base64_validator boolean_validator
  coordinate_validator credit_card_validator
].each do |name|
  require "lite/validators/#{name}"
end
