# frozen_string_literal: true

require "spec_helper"

RSpec.describe CurrencyValidator do
  before do
    class CurrencyKlass < MockedKlass

      validates :input0, currency: true

    end
  end

  let(:klass) { CurrencyKlass.new }

  describe "#validate" do
    it "to be valid" do
      pass!(1.1)
      pass!(1.01)
      pass!("1.01")
    end

    it "to not be valid" do
      fail!(nil)
      fail!(1)
      fail!(1.001)
      fail!("$1.01")
    end
  end

end
