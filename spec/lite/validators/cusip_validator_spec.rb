# frozen_string_literal: true

require "spec_helper"

RSpec.describe CusipValidator do
  before do
    class CusipKlass < MockedKlass

      validates :input0, cusip: true

    end
  end

  let(:klass) { CusipKlass.new }

  describe "#validate" do
    it "to be valid" do
      pass!("125509BG3")
    end

    it "to not be valid" do
      fail!(nil)
      fail!("12345678AB")
    end
  end

end
