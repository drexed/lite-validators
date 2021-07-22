# frozen_string_literal: true

require 'active_model' unless defined?(ActiveModel)

require 'lite/validators/railtie' if defined?(Rails::Railtie)
require 'lite/validators/version'

%w[
  base alpha alpha_numeric base64 boolean compare coordinate credit_card currency cusip email ein
  file_content_type file_extension file_size csv hex imei ip_address isbn isin mac_address name
  password phone_number sedol slug ssn time_zone type url username uuid
].each do |name|
  require "lite/validators/#{name}_validator"
end
