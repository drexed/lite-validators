# frozen_string_literal: true

require 'active_model'

# TODO:
# 1. Add locale file
# 2. Add following validators
#    - csv_validator

%w[
  version base_validator alpha_validator alpha_numeric_validator base64_validator boolean_validator
  coordinate_validator credit_card_validator currency_validator
].each do |name|
  require "lite/validators/#{name}"
end
