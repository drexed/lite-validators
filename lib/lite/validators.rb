# frozen_string_literal: true

require 'active_model'

%w[
  version
  alpha_numeric_validator
].each do |name|
  require "lite/validators/#{name}"
end
