# frozen_string_literal: true

require 'spec_helper'

RSpec.describe AlphaValidator do

  context 'with base options' do
    before do
      class AlphaAnyWithoutSpaceKlass < MockedKlass

        validates :input, alpha: true

      end
    end

    let(:klass) { AlphaAnyWithoutSpaceKlass.new }

    describe '#validate' do
      it 'to be valid' do
        klass.input = 'Test'
        expect(klass).to be_valid
      end

      it 'to not be valid' do
        klass.input = 'Test text'
        expect(klass).not_to be_valid

        klass.input = 'Test123'
        expect(klass).not_to be_valid

        klass.input = 'Test-text'
        expect(klass).not_to be_valid
      end
    end
  end

  context 'with options { allow_space: true }' do
    before do
      class AlphaAnyWithSpaceKlass < MockedKlass

        validates :input, alpha: { allow_space: true }

      end
    end

    let(:klass) { AlphaAnyWithSpaceKlass.new }

    describe '#validate' do
      it 'to be valid' do
        klass.input = 'Test text'
        expect(klass).to be_valid
      end

      it 'to not be valid' do
        klass.input = 'Test123'
        expect(klass).not_to be_valid

        klass.input = 'Test-text'
        expect(klass).not_to be_valid
      end
    end
  end

  context 'with options { case: :lower }' do
    before do
      class AlphaLowerWithoutSpaceKlass < MockedKlass

        validates :input, alpha: { case: :lower }

      end
    end

    let(:klass) { AlphaLowerWithoutSpaceKlass.new }

    describe '#validate' do
      it 'to be valid' do
        klass.input = 'test'
        expect(klass).to be_valid
      end

      it 'to not be valid' do
        klass.input = 'Test'
        expect(klass).not_to be_valid

        klass.input = 'test text'
        expect(klass).not_to be_valid

        klass.input = 'test 123'
        expect(klass).not_to be_valid

        klass.input = 'test-text'
        expect(klass).not_to be_valid
      end
    end
  end

  context 'with options { case: :lower, allow_space: true }' do
    before do
      class AlphaLowerWithSpaceKlass < MockedKlass

        validates :input, alpha: { case: :lower, allow_space: true }

      end
    end

    let(:klass) { AlphaLowerWithSpaceKlass.new }

    describe '#validate' do
      it 'to be valid' do
        klass.input = 'test text'
        expect(klass).to be_valid
      end

      it 'to not be valid' do
        klass.input = 'Test text'
        expect(klass).not_to be_valid

        klass.input = 'test 123'
        expect(klass).not_to be_valid

        klass.input = 'test-text'
        expect(klass).not_to be_valid
      end
    end
  end

  context 'with options { case: :upper }' do
    before do
      class AlphaUpperWithoutSpaceKlass < MockedKlass

        validates :input, alpha: { case: :upper }

      end
    end

    let(:klass) { AlphaUpperWithoutSpaceKlass.new }

    describe '#validate' do
      it 'to be valid' do
        klass.input = 'TEST'
        expect(klass).to be_valid
      end

      it 'to not be valid' do
        klass.input = 'Test'
        expect(klass).not_to be_valid

        klass.input = 'TEST TEXT'
        expect(klass).not_to be_valid

        klass.input = 'TEST 123'
        expect(klass).not_to be_valid

        klass.input = 'TEST-TEXT'
        expect(klass).not_to be_valid
      end
    end
  end

  context 'with options { case: :upper, allow_space: true }' do
    before do
      class AlphaUpperWithSpaceKlass < MockedKlass

        validates :input, alpha: { case: :upper, allow_space: true }

      end
    end

    let(:klass) { AlphaUpperWithSpaceKlass.new }

    describe '#validate' do
      it 'to be valid' do
        klass.input = 'TEST TEXT'
        expect(klass).to be_valid
      end

      it 'to not be valid' do
        klass.input = 'Test Text'
        expect(klass).not_to be_valid

        klass.input = 'TEST 123'
        expect(klass).not_to be_valid

        klass.input = 'TEST-TEXT'
        expect(klass).not_to be_valid
      end
    end
  end

end
