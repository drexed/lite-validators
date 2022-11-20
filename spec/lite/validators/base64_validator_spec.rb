# frozen_string_literal: true

require "spec_helper"

RSpec.describe Base64Validator do
  before do
    class Base64Klass < MockedKlass

      validates :input0, base64: true

    end
  end

  let(:klass) { Base64Klass.new }

  describe "#validate" do
    it "to be valid" do
      pass!("YW55IGNhcm5hbCBwbGVhcw==")
      pass!("YW55IGNhcm5hbCBwbGVhc3U=")
      pass!("YW55IGNhcm5hbCBwbGVhc3Vy")
      pass!("YW55IGNhcm5hbCBwbGVhc3VyZQ==")
      pass!("YW55IGNhcm5hbCBwbGVhc3VyZS4=")
    end

    it "to not be valid" do
      fail!(nil)
      fail!("1ab2==")
    end
  end

end
