# frozen_string_literal: true

require 'active_model'
require 'lite/validators/version'

# TODO: Rework type validator to use :is_not check
# TODO: Add locales
# TODO: Add following validators
#       - csv
#       - file_type

%w[
  base alpha alpha_numeric base64 boolean compare coordinate credit_card currency cusip email
  file_size hex imei ip_address isbn isin mac_address name password phone_number sedol slug ssn
  time_zone type url username uuid
].each do |name|
  require "lite/validators/#{name}_validator"
end
