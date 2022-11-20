# frozen_string_literal: true

require "spec_helper"

RSpec.describe CsvValidator do

  context "with missing dimension options" do
    before do
      class CsvMissingDimensionKlass < MockedKlass

        validates :input0, csv: true

      end
    end

    let(:klass) { CsvMissingDimensionKlass.new }

    describe "#validate" do
      it "to raise ArgumentError" do
        expect { klass.valid? }.to raise_error(ArgumentError)
      end
    end
  end

  context "with invalid dimension options" do
    before do
      class CsvInvalidDimensionKlass < MockedKlass

        validates :input0, csv: { test: { equal_to: 20 } }

      end
    end

    let(:klass) { CsvInvalidDimensionKlass.new }

    describe "#validate" do
      it "to raise ArgumentError" do
        expect { klass.valid? }.to raise_error(ArgumentError)
      end
    end
  end

  context "with invalid check options" do
    before do
      class CsvInvalidCheckKlass < MockedKlass

        validates :input0, csv: { columns: { test: 20 } }

      end
    end

    let(:klass) { CsvInvalidCheckKlass.new }

    describe "#validate" do
      it "to raise ArgumentError" do
        expect { klass.valid? }.to raise_error(ArgumentError)
      end
    end
  end

  context "with options { columns: { in: (6..12) } }" do
    before do
      class CsvRowInKlass < MockedKlass

        validates :input0, csv: { columns: { in: (6..12) } }

      end
    end

    let(:klass) { CsvRowInKlass.new }

    describe "#validate" do
      it "to be valid" do
        pass!(upload!("6x4.csv"))
      end

      it "to not be valid" do
        fail!(upload!("5x3.csv"))
      end

      it 'to be a "Input0 csv columns is not between 6 and 12" error message' do
        message?(upload!("5x3.csv"), message: "Input0 csv columns is not between 6 and 12")
      end
    end
  end

  context "with options { columns: { greater_than: 4 }, rows: { less_than: 4 } }" do
    before do
      class CsvRowLessThanKlass < MockedKlass

        validates :input0, csv: { columns: { greater_than: 4 }, rows: { less_than: 4 } }

      end
    end

    let(:klass) { CsvRowLessThanKlass.new }

    describe "#validate" do
      it "to be valid" do
        pass!(upload!("5x3.csv"))
      end

      it "to not be valid" do
        fail!(upload!("6x4.csv"))
      end

      it 'to be a "Input0 csv rows is not less than 4" error message' do
        message?(upload!("6x4.csv"), message: "Input0 csv rows is not less than 4")
      end
    end
  end

end
