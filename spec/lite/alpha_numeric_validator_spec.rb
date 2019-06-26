# frozen_string_literal: true

require 'spec_helper'

RSpec.describe AlphaNumericValidator do

  context 'with base options' do
    before do
      class AlphaNumericAnyWithoutSpaceKlass < MockedKlass

        validates :input, alpha_numeric: true

      end
    end

    let(:klass) { AlphaNumericAnyWithoutSpaceKlass.new }

    describe '#validate' do
      it 'to be valid' do
        klass.input = 'Test123'
        expect(klass).to be_valid
      end

      it 'to not be valid' do
        klass.input = 'Test 123'
        expect(klass).not_to be_valid

        klass.input = 'Test-123'
        expect(klass).not_to be_valid
      end
    end
  end

  context 'with options { allow_space: true }' do
    before do
      class AlphaNumericAnyWithSpaceKlass < MockedKlass

        validates :input, alpha_numeric: { allow_space: true }

      end
    end

    let(:klass) { AlphaNumericAnyWithSpaceKlass.new }

    describe '#validate' do
      it 'to be valid' do
        klass.input = 'Test 123'
        expect(klass).to be_valid
      end

      it 'to not be valid' do
        klass.input = 'Test-123'
        expect(klass).not_to be_valid
      end
    end
  end

  context 'with options { case: :lower }' do
    before do
      class AlphaNumericLowerWithoutSpaceKlass < MockedKlass

        validates :input, alpha_numeric: { case: :lower }

      end
    end

    let(:klass) { AlphaNumericLowerWithoutSpaceKlass.new }

    describe '#validate' do
      it 'to be valid' do
        klass.input = 'test123'
        expect(klass).to be_valid
      end

      it 'to not be valid' do
        klass.input = 'Test123'
        expect(klass).not_to be_valid

        klass.input = 'test 123'
        expect(klass).not_to be_valid

        klass.input = 'test-123'
        expect(klass).not_to be_valid
      end
    end
  end

  context 'with options { case: :lower, allow_space: true }' do
    before do
      class AlphaNumericLowerWithSpaceKlass < MockedKlass

        validates :input, alpha_numeric: { case: :lower, allow_space: true }

      end
    end

    let(:klass) { AlphaNumericLowerWithSpaceKlass.new }

    describe '#validate' do
      it 'to be valid' do
        klass.input = 'test 123'
        expect(klass).to be_valid
      end

      it 'to not be valid' do
        klass.input = 'Test 123'
        expect(klass).not_to be_valid

        klass.input = 'test-123'
        expect(klass).not_to be_valid
      end
    end
  end

  context 'with options { case: :upper }' do
    before do
      class AlphaNumericUpperWithoutSpaceKlass < MockedKlass

        validates :input, alpha_numeric: { case: :upper }

      end
    end

    let(:klass) { AlphaNumericUpperWithoutSpaceKlass.new }

    describe '#validate' do
      it 'to be valid' do
        klass.input = 'TEST123'
        expect(klass).to be_valid
      end

      it 'to not be valid' do
        klass.input = 'Test123'
        expect(klass).not_to be_valid

        klass.input = 'TEST 123'
        expect(klass).not_to be_valid

        klass.input = 'TEST-123'
        expect(klass).not_to be_valid
      end
    end
  end

  context 'with options { case: :upper, allow_space: true }' do
    before do
      class AlphaNumericUpperWithSpaceKlass < MockedKlass

        validates :input, alpha_numeric: { case: :upper, allow_space: true }

      end
    end

    let(:klass) { AlphaNumericUpperWithSpaceKlass.new }

    describe '#validate' do
      it 'to be valid' do
        klass.input = 'TEST 123'
        expect(klass).to be_valid
      end

      it 'to not be valid' do
        klass.input = 'Test 123'
        expect(klass).not_to be_valid

        klass.input = 'TEST-123'
        expect(klass).not_to be_valid
      end
    end
  end

end
