# frozen_string_literal: true

require 'spec_helper'

RSpec.describe FileSizeValidator do

  # context 'with invalid to options' do
  #   before do
  #     class FileSizeInvalidToKlass < MockedKlass
  #
  #       validates :input_0, file_size: { operator: :less_than }
  #
  #     end
  #   end
  #
  #   let(:klass) { FileSizeInvalidToKlass.new }
  #
  #   describe '#validate' do
  #     it 'to raise ArgumentError' do
  #       expect { klass.valid? }.to raise_error(ArgumentError)
  #     end
  #   end
  # end
  #
  # context 'with invalid operator options' do
  #   before do
  #     class FileSizeInvalidOperatorKlass < MockedKlass
  #
  #       validates :input_0, file_size: { operator: :test, to: :input_1 }
  #
  #     end
  #   end
  #
  #   let(:klass) { FileSizeInvalidOperatorKlass.new }
  #
  #   describe '#validate' do
  #     it 'to raise ArgumentError' do
  #       expect { klass.valid? }.to raise_error(ArgumentError)
  #     end
  #   end
  # end

  context 'with options { less_than: 100 }' do
    before do
      class FileSizeLessThanKlass < MockedKlass

        validates :input_0, file_size: { less_than: 100 }

      end
    end

    let(:klass) { FileSizeLessThanKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!(upload('5x3.csv'))
      end

      it 'to not be valid' do
        fail!(upload('csv.txt'))
      end
    end
  end

end
