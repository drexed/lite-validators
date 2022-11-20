# frozen_string_literal: true

require "spec_helper"

RSpec.describe IsbnValidator do
  before do
    class IsbnKlass < MockedKlass

      validates :input0, isbn: true

    end
  end

  let(:klass) { IsbnKlass.new }

  describe "#validate" do
    it "to be valid" do
      pass!(9_519_854_894)
      pass!("9519854894")
      pass!("951-98548 9 4")
      pass!("0-9722051-1-X")
      pass!("9781590599938")
      pass!("978-159059 9938")
    end

    it "to not be valid" do
      fail!(nil)
      fail!("951-98548-9-p")
      fail!("abc123ab3344")
      fail!("12345678901234")
      fail!("9991a9010599938")
    end
  end

end
