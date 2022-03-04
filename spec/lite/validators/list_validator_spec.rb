# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ListValidator do

  context 'with missing check options' do
    before do
      class ListMissingCheckKlass < MockedKlass

        validates :input0, list: true

      end
    end

    let(:klass) { ListMissingCheckKlass.new }

    describe '#validate' do
      it 'to raise ArgumentError' do
        expect { klass.valid? }.to raise_error(ArgumentError)
      end
    end
  end

  context 'with invalid check options' do
    before do
      class ListInvalidCheckKlass < MockedKlass

        validates :input0, list: { test: [1, 2] }

      end
    end

    let(:klass) { ListInvalidCheckKlass.new }

    describe '#validate' do
      it 'to raise ArgumentError' do
        expect { klass.valid? }.to raise_error(ArgumentError)
      end
    end
  end

  context 'with options { all: [1, 2] }' do
    before do
      class ListAllKlass < MockedKlass

        validates :input0, list: { all: [1, 2] }

      end
    end

    let(:klass) { ListAllKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!([1, 2])
      end

      it 'to not be valid' do
        fail!([1, 3])
        fail!([3, 4])
      end
    end
  end

  context 'with options { any: [1, 2] }' do
    before do
      class ListAnyKlass < MockedKlass

        validates :input0, list: { any: [1, 2] }

      end
    end

    let(:klass) { ListAnyKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!([1, 2])
        pass!([1, 3])
      end

      it 'to not be valid' do
        fail!([3, 4])
      end
    end
  end

  context 'with options { none: [1, 2] }' do
    before do
      class ListNoneKlass < MockedKlass

        validates :input0, list: { none: [1, 2] }

      end
    end

    let(:klass) { ListNoneKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!([3, 4])
      end

      it 'to not be valid' do
        fail!([1, 2])
        fail!([1, 3])
      end
    end
  end

  context 'with options { any: [1, 2], none: [3, 4] }' do
    before do
      class ListMultiKlass < MockedKlass

        validates :input0, list: { any: [1, 2], none: [3, 4] }

      end
    end

    let(:klass) { ListMultiKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!([1, 2])
        pass!([1, 5])
      end

      it 'to not be valid' do
        fail!([3, 4])
        fail!([1, 4])
      end
    end
  end

end
