# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CompareValidator do

  context 'with invalid to options' do
    before do
      class CompareInvalidToKlass < MockedKlass

        validates :input0, compare: { to: :input99, check: :less_than }

      end
    end

    let(:klass) { CompareInvalidToKlass.new }

    describe '#validate' do
      it 'to raise NoMethodError' do
        klass.input0 = 0
        klass.input1 = 1

        expect { klass.valid? }.to raise_error(NoMethodError)
      end
    end
  end

  context 'with missing to options' do
    before do
      class CompareMissingToKlass < MockedKlass

        validates :input0, compare: { check: :less_than }

      end
    end

    let(:klass) { CompareMissingToKlass.new }

    describe '#validate' do
      it 'to raise ArgumentError' do
        expect { klass.valid? }.to raise_error(ArgumentError)
      end
    end
  end

  context 'with invalid check options' do
    before do
      class CompareInvalidOperatorKlass < MockedKlass

        validates :input0, compare: { to: :input1, check: :test }

      end
    end

    let(:klass) { CompareInvalidOperatorKlass.new }

    describe '#validate' do
      it 'to raise ArgumentError' do
        expect { klass.valid? }.to raise_error(ArgumentError)
      end
    end
  end

  context 'with options { to: :input1, check: :less_than }' do
    before do
      class CompareLessThanKlass < MockedKlass

        validates :input0, compare: { to: :input1, check: :less_than }

      end
    end

    let(:klass) { CompareLessThanKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!(0, 1)
      end

      it 'to not be valid' do
        fail!(1, 1)
        fail!(1, 0)
      end
    end
  end

  context 'with options { to: :input1, check: :less_than_or_equal_to }' do
    before do
      class CompareLessThanOrEqualToKlass < MockedKlass

        validates :input0, compare: { to: :input1, check: :less_than_or_equal_to }

      end
    end

    let(:klass) { CompareLessThanOrEqualToKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!(0, 1)
        pass!(1, 1)
      end

      it 'to not be valid' do
        fail!(1, 0)
      end
    end
  end

  context 'with options { to: :input1, check: :greater_than }' do
    before do
      class CompareGreaterThanKlass < MockedKlass

        validates :input0, compare: { to: :input1, check: :greater_than }

      end
    end

    let(:klass) { CompareGreaterThanKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!(1, 0)
      end

      it 'to not be valid' do
        fail!(1, 1)
        fail!(0, 1)
      end
    end
  end

  context 'with options { to: :input1, check: :greater_than_or_equal_to }' do
    before do
      class CompareGreaterThanOrEqualToKlass < MockedKlass

        validates :input0, compare: { to: :input1, check: :greater_than_or_equal_to }

      end
    end

    let(:klass) { CompareGreaterThanOrEqualToKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!(1, 0)
        pass!(1, 1)
      end

      it 'to not be valid' do
        fail!(0, 1)
      end
    end
  end

  context 'with options { to: :input1, check: :equal_to }' do
    before do
      class CompareEqualToKlass < MockedKlass

        validates :input0, compare: { to: :input1, check: :equal_to }

      end
    end

    let(:klass) { CompareEqualToKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!(1, 1)
      end

      it 'to not be valid' do
        fail!(0, 1)
        fail!(1, 0)
      end
    end
  end

  context 'with options { to: :input1, check: :not_equal_to }' do
    before do
      class CompareNotEqualToKlass < MockedKlass

        validates :input0, compare: { to: :input1, check: :not_equal_to }

      end
    end

    let(:klass) { CompareNotEqualToKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!(0, 1)
        pass!(1, 0)
      end

      it 'to not be valid' do
        fail!(1, 1)
      end
    end
  end

end
