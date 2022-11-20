# frozen_string_literal: true

require "spec_helper"

RSpec.describe IpAddressValidator do

  context "with base options" do
    before do
      class IpAddressKlass < MockedKlass

        validates :input0, ip_address: true

      end
    end

    let(:klass) { IpAddressKlass.new }

    describe "#validate" do
      it "to be valid" do
        pass!("0.0.0.0")
        pass!("127.0.0.1")
        pass!("99.39.240.31")
        pass!("0000:0000:0000:0000:0000:0000:0000:0000")
        pass!("::ffff:192.168.1.26")
        pass!("fe80::")
      end

      it "to not be valid" do
        fail!(nil)
        fail!("0 0 0 0")
        fail!("0.0.0.0:3000")
        fail!("22.22.333.22")
        fail!("FF02:0000:0000:0000:0000:0000:0000:0000:0001")
        fail!("::1111:2222:3333:4444:5555:6666::")
        fail!("3ffe:b00::1::a")
      end
    end
  end

  context "with invalid protocol options" do
    before do
      class IpAddressInvalidProtocolKlass < MockedKlass

        validates :input0, ip_address: { protocol: :test }

      end
    end

    let(:klass) { IpAddressInvalidProtocolKlass.new }

    describe "#validate" do
      it "to raise ArgumentError" do
        expect { klass.valid? }.to raise_error(ArgumentError)
      end
    end
  end

  context "with options { protocol: :ipv4 }" do
    before do
      class IpAddressv4Klass < MockedKlass

        validates :input0, ip_address: { protocol: :ipv4 }

      end
    end

    let(:klass) { IpAddressv4Klass.new }

    describe "#validate" do
      it "to be valid" do
        pass!("0.0.0.0")
        pass!("127.0.0.1")
        pass!("99.39.240.31")
      end

      it "to not be valid" do
        fail!(nil)
        fail!("0 0 0 0")
        fail!("0.0.0.0:3000")
        fail!("22.22.333.22")
      end
    end
  end

  context 'with options { include_address: ["0.0.0.0", "99.39.240.31"] }' do
    before do
      class IpAddressIncludeAddressKlass < MockedKlass

        validates :input0, ip_address: { include_address: ["0.0.0.0", "99.39.240.31"] }

      end
    end

    let(:klass) { IpAddressIncludeAddressKlass.new }

    describe "#validate" do
      it "to be valid" do
        pass!("0.0.0.0")
        pass!("99.39.240.31")
      end

      it "to not be valid" do
        fail!(nil)
        fail!("127.0.0.1")
        fail!("0.0.0.0:3000")
        fail!("22.22.333.22")
      end

      it 'to be a "Input0 has an invalid address" error message' do
        message?("99.39.240.32", message: "Input0 has an invalid address")
      end
    end
  end

  context 'with options { exclude_address: ["0.0.0.0", "99.39.240.31"] }' do
    before do
      class IpAddressExcludeAddressKlass < MockedKlass

        validates :input0, ip_address: { exclude_address: ["0.0.0.0", "99.39.240.31"] }

      end
    end

    let(:klass) { IpAddressExcludeAddressKlass.new }

    describe "#validate" do
      it "to be valid" do
        pass!("127.0.0.1")
        pass!("99.39.240.32")
      end

      it "to not be valid" do
        fail!(nil)
        fail!("0.0.0.0")
        fail!("99.39.240.31")
        fail!("0.0.0.0:3000")
      end

      it 'to be a "Input0 has an invalid address" error message' do
        message?("99.39.240.31", message: "Input0 has an invalid address")
      end
    end
  end

end
