# frozen_string_literal: true

require "spec_helper"

RSpec.describe ImeiValidator do
  before do
    class ImeiKlass < MockedKlass

      validates :input0, imei: true

    end
  end

  let(:klass) { ImeiKlass.new }

  describe "#validate" do
    it "to be valid" do
      pass!(356_843_052_637_512)
      pass!("356843052637512")
      pass!("35-684305-2637512")
      pass!("35-684305.263.7512")
    end

    it "to not be valid" do
      fail!(nil)
      fail!("3568430537512")
      fail!("35684305263751233")
      fail!("356843052637513")
      fail!("156843052637512")
    end
  end

end
