# frozen_string_literal: true

require 'spec_helper'

RSpec.describe FileSizeValidator do

  context 'with missing check options' do
    before do
      class FileSizeMissingCheckKlass < MockedKlass

        validates :input_0, file_size: true

      end
    end

    let(:klass) { FileSizeMissingCheckKlass.new }

    describe '#validate' do
      it 'to raise ArgumentError' do
        expect { klass.valid? }.to raise_error(ArgumentError)
      end
    end
  end

  context 'with invalid check options' do
    before do
      class FileSizeInvalidCheckKlass < MockedKlass

        validates :input_0, file_size: { test: 100 }

      end
    end

    let(:klass) { FileSizeInvalidCheckKlass.new }

    describe '#validate' do
      it 'to raise ArgumentError' do
        expect { klass.valid? }.to raise_error(ArgumentError)
      end
    end
  end

  context 'with options { less_than: 100 }' do
    before do
      class FileSizeLessThanKlass < MockedKlass

        validates :input_0, file_size: { less_than: 100 }

      end
    end

    let(:klass) { FileSizeLessThanKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!(upload!('5x3.csv'))
      end

      it 'to not be valid' do
        fail!(upload!('csv.txt'))
      end

      it 'to be a "Input 0 is not less than 100" error message' do
        message?(upload!('csv.txt'), message: 'Input 0 file size is not less than 100')
      end
    end
  end

  context 'with options { greater_than: 75, less_than: 100 }' do
    before do
      class FileSizeGreaterAndLessThanKlass < MockedKlass

        validates :input_0, file_size: { greater_than: 75, less_than: 100 }

      end
    end

    let(:klass) { FileSizeGreaterAndLessThanKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!(upload!('5x3.csv'))
      end

      it 'to not be valid' do
        fail!(upload!('csv.txt'))
      end
    end
  end

  context 'with options { in: (75..100) }' do
    before do
      class FileSizeRangeKlass < MockedKlass

        validates :input_0, file_size: { in: (75..100) }

      end
    end

    let(:klass) { FileSizeRangeKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!(upload!('5x3.csv'))
      end

      it 'to not be valid' do
        fail!(upload!('csv.txt'))
      end

      it 'to be a "Input 0 is not between 75 and 100" error message' do
        message?(upload!('csv.txt'), message: 'Input 0 file size is not between 75 and 100')
      end
    end
  end

end
