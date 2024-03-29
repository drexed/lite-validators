# frozen_string_literal: true

require "spec_helper"

RSpec.describe TypeValidator do

  context "with invalid is options" do
    before do
      class TypeInvalidIsKlass < MockedKlass

        validates :input0, type: true

      end
    end

    let(:klass) { TypeInvalidIsKlass.new }

    describe "#validate" do
      it "to raise ArgumentError" do
        expect { klass.valid? }.to raise_error(ArgumentError)
      end
    end
  end

  context "with options { is: Array }" do
    before do
      class TypeArrayKlass < MockedKlass

        validates :input0, type: { is: Array }

      end
    end

    let(:klass) { TypeArrayKlass.new }

    describe "#validate" do
      it "to be valid" do
        pass!([])
      end

      it "to not be valid" do
        fail!(nil)
        fail!(1)
        fail!("test")
        fail!({})
        fail!(true)
        fail!(false)
      end
    end
  end

  context "with options { is: Boolean }" do
    before do
      class TypeBooleanKlass < MockedKlass

        validates :input0, type: { is: Boolean }

      end
    end

    let(:klass) { TypeBooleanKlass.new }

    describe "#validate" do
      it "to be valid" do
        pass!(true)
        pass!(false)
      end

      it "to not be valid" do
        fail!(nil)
        fail!(1)
        fail!("test")
        fail!({})
        fail!([])
      end
    end
  end

  context "with options { is: [CustomKlass, Hash] }" do
    before do
      class CustomKlass; end

      class TypeMultiKlass < MockedKlass

        validates :input0, type: { is: [CustomKlass, Hash] }

      end
    end

    let(:klass) { TypeMultiKlass.new }

    describe "#validate" do
      it "to be valid" do
        pass!({})
        pass!(CustomKlass.new)
      end

      it "to not be valid" do
        fail!(nil)
        fail!(1)
        fail!("test")
        fail!([])
        fail!(true)
        fail!(false)
      end
    end
  end

  context "with options { is_not: [String, Integer] }" do
    before do
      class TypeMultiNotKlass < MockedKlass

        validates :input0, type: { is_not: [String, Integer] }

      end
    end

    let(:klass) { TypeMultiNotKlass.new }

    describe "#validate" do
      it "to be valid" do
        pass!([])
        pass!({})
        pass!(true)
        pass!(false)
      end

      it "to not be valid" do
        fail!(nil)
        fail!(1)
        fail!("test")
      end
    end
  end

end
