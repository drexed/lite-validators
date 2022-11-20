# frozen_string_literal: true

require "spec_helper"

RSpec.describe SedolValidator do
  before do
    class SedolKlass < MockedKlass

      validates :input0, sedol: true

    end
  end

  let(:klass) { SedolKlass.new }

  describe "#validate" do
    it "to be valid" do
      pass!("B0WNLY7")
    end

    it "to not be valid" do
      fail!(nil)
      fail!("B0WNLY")
      fail!("B0WNLY77")
    end
  end

end
