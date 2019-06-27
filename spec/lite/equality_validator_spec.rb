# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EqualityValidator do

  context 'with invalid to options' do
    before do
      class EqualityInvalidToKlass < MockedKlass

        validates :input_0, equality: { operator: :less_than }

      end
    end

    let(:klass) { EqualityInvalidToKlass.new }

    describe '#validate' do
      it 'to raise ArgumentError' do
        expect { klass.valid? }.to raise_error(ArgumentError)
      end
    end
  end

  context 'with invalid operator options' do
    before do
      class EqualityInvalidOperatorKlass < MockedKlass

        validates :input_0, equality: { operator: :test, to: :input_1 }

      end
    end

    let(:klass) { EqualityInvalidOperatorKlass.new }

    describe '#validate' do
      it 'to raise ArgumentError' do
        expect { klass.valid? }.to raise_error(ArgumentError)
      end
    end
  end

  context 'with options { operator: :less_than, to: :input_1 }' do
    before do
      class EqualityLessThanKlass < MockedKlass

        validates :input_0, equality: { operator: :less_than, to: :input_1 }

      end
    end

    let(:klass) { EqualityLessThanKlass.new }

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

  context 'with options { operator: :less_than_or_equal_to, to: :input_1 }' do
    before do
      class EqualityLessThanOrEqualToKlass < MockedKlass

        validates :input_0, equality: { operator: :less_than_or_equal_to, to: :input_1 }

      end
    end

    let(:klass) { EqualityLessThanOrEqualToKlass.new }

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

  context 'with options { operator: :greater_than, to: :input_1 }' do
    before do
      class EqualityGreaterThanKlass < MockedKlass

        validates :input_0, equality: { operator: :greater_than, to: :input_1 }

      end
    end

    let(:klass) { EqualityGreaterThanKlass.new }

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

  context 'with options { operator: :greater_than_or_equal_to, to: :input_1 }' do
    before do
      class EqualityGreaterThanOrEqualToKlass < MockedKlass

        validates :input_0, equality: { operator: :greater_than_or_equal_to, to: :input_1 }

      end
    end

    let(:klass) { EqualityGreaterThanOrEqualToKlass.new }

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

  context 'with options { operator: :equal_to, to: :input_1 }' do
    before do
      class EqualityEqualToKlass < MockedKlass

        validates :input_0, equality: { operator: :equal_to, to: :input_1 }

      end
    end

    let(:klass) { EqualityEqualToKlass.new }

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

  context 'with options { operator: :not_equal_to, to: :input_1 }' do
    before do
      class EqualityNotEqualToKlass < MockedKlass

        validates :input_0, equality: { operator: :not_equal_to, to: :input_1 }

      end
    end

    let(:klass) { EqualityNotEqualToKlass.new }

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
