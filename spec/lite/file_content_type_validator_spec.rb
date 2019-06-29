# frozen_string_literal: true

require 'spec_helper'

RSpec.describe FileContentTypeValidator do

  context 'with missing check options' do
    before do
      class FileContentTypeMissingCheckKlass < MockedKlass

        validates :input_0, file_content_type: true

      end
    end

    let(:klass) { FileContentTypeMissingCheckKlass.new }

    describe '#validate' do
      it 'to raise ArgumentError' do
        expect { klass.valid? }.to raise_error(ArgumentError)
      end
    end
  end

  context 'with invalid check options' do
    before do
      class FileContentTypeInvalidCheckKlass < MockedKlass

        validates :input_0, file_content_type: { test: 'image/png' }

      end
    end

    let(:klass) { FileContentTypeInvalidCheckKlass.new }

    describe '#validate' do
      it 'to raise ArgumentError' do
        expect { klass.valid? }.to raise_error(ArgumentError)
      end
    end
  end

  context 'with options { include: "text/csv" }' do
    before do
      class FileContentTypeIncludeKlass < MockedKlass

        validates :input_0, file_content_type: { include: 'text/csv' }

      end
    end

    let(:klass) { FileContentTypeIncludeKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!(upload('5x3.csv'))
      end

      it 'to not be valid' do
        fail!(upload('csv.txt'))
      end
    end
  end

  context 'with options { exclude: %w[image/png text/plain] }' do
    before do
      class FileContentTypeExcludeKlass < MockedKlass

        validates :input_0, file_content_type: { exclude: %w[image/png text/plain] }

      end
    end

    let(:klass) { FileContentTypeExcludeKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!(upload('5x3.csv'))
      end

      it 'to not be valid' do
        fail!(upload('csv.txt'))
      end
    end
  end

  context 'with options { include: /^text\/.*/, exclude: "text/csv" }' do
    before do
      class FileContentTypeMultiKlass < MockedKlass

        validates :input_0, file_content_type: { include: /^text\/.*/, exclude: 'text/csv' }

      end
    end

    let(:klass) { FileContentTypeMultiKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!(upload('csv.txt'))
      end

      it 'to not be valid' do
        fail!(upload('5x3.csv'))
      end
    end
  end

end
