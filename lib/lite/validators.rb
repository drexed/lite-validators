# frozen_string_literal: true

require 'active_model'

# TODO: Add locale file
# TODO: Add following validators
#       - csv_validator
#       - file_size_validator

%w[
  version base_validator alpha_validator alpha_numeric_validator base64_validator boolean_validator
  coordinate_validator credit_card_validator currency_validator cusip_validator email_validator
  equality_validator hex_validator imei_validator ip_address_validator isbn_validator isin_validator
  mac_address_validator name_validator password_validator phone_number_validator sedol_validator
].each do |name|
  require "lite/validators/#{name}"
end
