# frozen_string_literal: true

require "spec_helper"

RSpec.describe CoordinateValidator do

  context "with base options" do
    before do
      class CoordinateKlass < MockedKlass

        validates :input0, coordinate: true

      end
    end

    let(:klass) { CoordinateKlass.new }

    describe "#validate" do
      it "to be valid" do
        pass!(%w[90 180])
        pass!([90, 180])
        pass!([-90.0, -180.0])
      end

      it "to not be valid" do
        fail!(nil)
        fail!([90, 181])
        fail!([-90.1, -180.0])
      end
    end
  end

  context "with invalid boundary options" do
    before do
      class CoordinateInvalidBoundaryKlass < MockedKlass

        validates :input0, coordinate: { boundary: :test }

      end
    end

    let(:klass) { CoordinateInvalidBoundaryKlass.new }

    describe "#validate" do
      it "to raise ArgumentError" do
        expect { klass.valid? }.to raise_error(ArgumentError)
      end
    end
  end

  context "with options { boundary: :latitude }" do
    before do
      class CoordinateLatitudeKlass < MockedKlass

        validates :input0, coordinate: { boundary: :latitude }

      end
    end

    let(:klass) { CoordinateLatitudeKlass.new }

    describe "#validate" do
      it "to be valid" do
        pass!("90")
        pass!(90)
        pass!(-90.0)
      end

      it "to not be valid" do
        fail!(nil)
        fail!(91)
        fail!(-90.1)
      end
    end
  end

  context "with options { boundary: :longitude }" do
    before do
      class CoordinateLongitudeKlass < MockedKlass

        validates :input0, coordinate: { boundary: :longitude }

      end
    end

    let(:klass) { CoordinateLongitudeKlass.new }

    describe "#validate" do
      it "to be valid" do
        pass!("180")
        pass!(180)
        pass!(-180.0)
      end

      it "to not be valid" do
        fail!(nil)
        fail!(181)
        fail!(-180.1)
      end
    end
  end

end
