# frozen_string_literal: true

require 'spec_helper'

RSpec.describe FileExtensionValidator do

  context 'with missing check options' do
    before do
      class FileExtensionMissingCheckKlass < MockedKlass

        validates :input_0, file_extension: true

      end
    end

    let(:klass) { FileExtensionMissingCheckKlass.new }

    describe '#validate' do
      it 'to raise ArgumentError' do
        expect { klass.valid? }.to raise_error(ArgumentError)
      end
    end
  end

  context 'with invalid check options' do
    before do
      class FileExtensionInvalidCheckKlass < MockedKlass

        validates :input_0, file_extension: { test: :csv }

      end
    end

    let(:klass) { FileExtensionInvalidCheckKlass.new }

    describe '#validate' do
      it 'to raise ArgumentError' do
        expect { klass.valid? }.to raise_error(ArgumentError)
      end
    end
  end

  context 'with options { include: :csv }' do
    before do
      class FileExtensionIncludeKlass < MockedKlass

        validates :input_0, file_extension: { include: :csv }

      end
    end

    let(:klass) { FileExtensionIncludeKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!(upload!('5x3.csv'))
      end

      it 'to not be valid' do
        fail!(upload!('csv.txt'))
      end
    end
  end

  context 'with options { exclude: [:csv, "png"] }' do
    before do
      class FileExtensionExcludeKlass < MockedKlass

        validates :input_0, file_extension: { exclude: [:csv, 'png'] }

      end
    end

    let(:klass) { FileExtensionExcludeKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!(upload!('csv.txt'))
      end

      it 'to not be valid' do
        fail!(upload!('5x3.csv'))
      end
    end
  end

end
