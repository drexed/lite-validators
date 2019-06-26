# frozen_string_literal: true

require 'active_model'

%w[
  version
  base_validator
  alpha_numeric_validator
  alpha_validator
].each do |name|
  require "lite/validators/#{name}"
end
