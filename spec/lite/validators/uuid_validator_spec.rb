# frozen_string_literal: true

require "spec_helper"

RSpec.describe UuidValidator do

  context "with base options" do
    before do
      class UuidKlass < MockedKlass

        validates :input0, uuid: true

      end
    end

    let(:klass) { UuidKlass.new }

    describe "#validate" do
      it "to be valid" do
        pass!("a8098c1a-f86e-11da-bd1a-00112444be1e")
        pass!("6fa459ea-ee8a-3ca4-894e-db77e160355e")
        pass!("16fd2706-8baf-433b-82eb-8c7fada847da")
        pass!("886313e1-3b8a-5372-9b90-0c9aee199e5d")
      end

      it "to not be valid" do
        fail!(nil)
        fail!("a8098c1a-f86e-11da-bd1a-00112444be1e1")
        fail!("6fa459ea-ee8a-3ca4-894e-db77e160355e1")
        fail!("16fd2706-8baf-433b-82eb-8c7fada847da1")
        fail!("886313e1-3b8a-5372-9b90-0c9aee199e5d1")
      end
    end
  end

  context "with invalid version options" do
    before do
      class UuidInvalidVersionKlass < MockedKlass

        validates :input0, uuid: { version: 2 }

      end
    end

    let(:klass) { UuidInvalidVersionKlass.new }

    describe "#validate" do
      it "to raise ArgumentError" do
        expect { klass.valid? }.to raise_error(ArgumentError)
      end
    end
  end

  context "with options { version: 3 }" do
    before do
      class UuidVersion3Klass < MockedKlass

        validates :input0, uuid: { version: 3 }

      end
    end

    let(:klass) { UuidVersion3Klass.new }

    describe "#validate" do
      it "to be valid" do
        pass!("6fa459ea-ee8a-3ca4-894e-db77e160355e")
      end

      it "to not be valid" do
        fail!(nil)
        fail!("a8098c1a-f86e-11da-bd1a-00112444be1e")
        fail!("6fa459ea-ee8a-3ca4-894e-db77e160355e1")
        fail!("16fd2706-8baf-433b-82eb-8c7fada847da")
        fail!("886313e1-3b8a-5372-9b90-0c9aee199e5d")
      end
    end
  end

  context "with options { version: 4 }" do
    before do
      class UuidVersion4Klass < MockedKlass

        validates :input0, uuid: { version: 4 }

      end
    end

    let(:klass) { UuidVersion4Klass.new }

    describe "#validate" do
      it "to be valid" do
        pass!("16fd2706-8baf-433b-82eb-8c7fada847da")
      end

      it "to not be valid" do
        fail!(nil)
        fail!("a8098c1a-f86e-11da-bd1a-00112444be1e")
        fail!("6fa459ea-ee8a-3ca4-894e-db77e160355e")
        fail!("16fd2706-8baf-433b-82eb-8c7fada847da1")
        fail!("886313e1-3b8a-5372-9b90-0c9aee199e5d")
      end
    end
  end

  context "with options { version: 5 }" do
    before do
      class UuidVersion5Klass < MockedKlass

        validates :input0, uuid: { version: 5 }

      end
    end

    let(:klass) { UuidVersion5Klass.new }

    describe "#validate" do
      it "to be valid" do
        pass!("886313e1-3b8a-5372-9b90-0c9aee199e5d")
      end

      it "to not be valid" do
        fail!(nil)
        fail!("a8098c1a-f86e-11da-bd1a-00112444be1e")
        fail!("6fa459ea-ee8a-3ca4-894e-db77e160355e")
        fail!("16fd2706-8baf-433b-82eb-8c7fada847da")
        fail!("886313e1-3b8a-5372-9b90-0c9aee199e5d1")
      end
    end
  end

end
