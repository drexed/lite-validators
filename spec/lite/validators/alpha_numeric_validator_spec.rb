# frozen_string_literal: true

require 'spec_helper'

RSpec.describe AlphaNumericValidator do

  context 'with base options' do
    before do
      class AlphaNumericAnyWithoutSpaceKlass < MockedKlass

        validates :input0, alpha_numeric: true

      end
    end

    let(:klass) { AlphaNumericAnyWithoutSpaceKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!('Test123')
      end

      it 'to not be valid' do
        fail!(nil)
        fail!('Test 123')
        fail!('Test-123')
      end
    end
  end

  context 'with invalid case options' do
    before do
      class AlphaNumericInvalidCaseKlass < MockedKlass

        validates :input0, alpha_numeric: { case: :camel }

      end
    end

    let(:klass) { AlphaNumericInvalidCaseKlass.new }

    describe '#validate' do
      it 'to raise ArgumentError' do
        expect { klass.valid? }.to raise_error(ArgumentError)
      end
    end
  end

  context 'with options { allow_space: true }' do
    before do
      class AlphaNumericAnyWithSpaceKlass < MockedKlass

        validates :input0, alpha_numeric: { allow_space: true }

      end
    end

    let(:klass) { AlphaNumericAnyWithSpaceKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!('Test 123')
      end

      it 'to not be valid' do
        fail!(nil)
        fail!('Test-123')
      end
    end
  end

  context 'with options { case: :lower }' do
    before do
      class AlphaNumericLowerWithoutSpaceKlass < MockedKlass

        validates :input0, alpha_numeric: { case: :lower }

      end
    end

    let(:klass) { AlphaNumericLowerWithoutSpaceKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!('test123')
      end

      it 'to not be valid' do
        fail!(nil)
        fail!('Test123')
        fail!('test 123')
        fail!('test-123')
      end
    end
  end

  context 'with options { case: :lower, allow_space: true }' do
    before do
      class AlphaNumericLowerWithSpaceKlass < MockedKlass

        validates :input0, alpha_numeric: { case: :lower, allow_space: true }

      end
    end

    let(:klass) { AlphaNumericLowerWithSpaceKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!('test 123')
      end

      it 'to not be valid' do
        fail!(nil)
        fail!('Test 123')
        fail!('test-123')
      end
    end
  end

  context 'with options { case: :upper }' do
    before do
      class AlphaNumericUpperWithoutSpaceKlass < MockedKlass

        validates :input0, alpha_numeric: { case: :upper }

      end
    end

    let(:klass) { AlphaNumericUpperWithoutSpaceKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!('TEST123')
      end

      it 'to not be valid' do
        fail!(nil)
        fail!('Test123')
        fail!('TEST 123')
        fail!('TEST-123')
      end
    end
  end

  context 'with options { case: :upper, allow_space: true }' do
    before do
      class AlphaNumericUpperWithSpaceKlass < MockedKlass

        validates :input0, alpha_numeric: { case: :upper, allow_space: true }

      end
    end

    let(:klass) { AlphaNumericUpperWithSpaceKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!('TEST 123')
      end

      it 'to not be valid' do
        fail!(nil)
        fail!('Test 123')
        fail!('TEST-123')
      end
    end
  end

end
