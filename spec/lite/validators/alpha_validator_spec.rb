# frozen_string_literal: true

require 'spec_helper'

RSpec.describe AlphaValidator do

  context 'with base options' do
    before do
      class AlphaAnyWithoutSpaceKlass < MockedKlass

        validates :input0, alpha: true

      end
    end

    let(:klass) { AlphaAnyWithoutSpaceKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!('Test')
      end

      it 'to not be valid' do
        fail!(nil)
        fail!('Test text')
        fail!('Test123')
        fail!('Test-text')
      end
    end
  end

  context 'with invalid case options' do
    before do
      class AlphaInvalidCaseKlass < MockedKlass

        validates :input0, alpha: { case: :camel }

      end
    end

    let(:klass) { AlphaInvalidCaseKlass.new }

    describe '#validate' do
      it 'to raise ArgumentError' do
        expect { klass.valid? }.to raise_error(ArgumentError)
      end
    end
  end

  context 'with options { allow_space: true }' do
    before do
      class AlphaAnyWithSpaceKlass < MockedKlass

        validates :input0, alpha: { allow_space: true }

      end
    end

    let(:klass) { AlphaAnyWithSpaceKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!('Test text')
      end

      it 'to not be valid' do
        fail!(nil)
        fail!('Test123')
        fail!('Test-text')
      end
    end
  end

  context 'with options { case: :lower }' do
    before do
      class AlphaLowerWithoutSpaceKlass < MockedKlass

        validates :input0, alpha: { case: :lower }

      end
    end

    let(:klass) { AlphaLowerWithoutSpaceKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!('test')
      end

      it 'to not be valid' do
        fail!(nil)
        fail!('Test')
        fail!('test text')
        fail!('test 123')
        fail!('test-text')
      end
    end
  end

  context 'with options { case: :lower, allow_space: true }' do
    before do
      class AlphaLowerWithSpaceKlass < MockedKlass

        validates :input0, alpha: { case: :lower, allow_space: true }

      end
    end

    let(:klass) { AlphaLowerWithSpaceKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!('test text')
      end

      it 'to not be valid' do
        fail!(nil)
        fail!('Test text')
        fail!('test 123')
        fail!('test-text')
      end
    end
  end

  context 'with options { case: :upper }' do
    before do
      class AlphaUpperWithoutSpaceKlass < MockedKlass

        validates :input0, alpha: { case: :upper }

      end
    end

    let(:klass) { AlphaUpperWithoutSpaceKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!('TEST')
      end

      it 'to not be valid' do
        fail!(nil)
        fail!('Test')
        fail!('TEST TEXT')
        fail!('TEST 123')
        fail!('TEST-TEXT')
      end
    end
  end

  context 'with options { case: :upper, allow_space: true }' do
    before do
      class AlphaUpperWithSpaceKlass < MockedKlass

        validates :input0, alpha: { case: :upper, allow_space: true }

      end
    end

    let(:klass) { AlphaUpperWithSpaceKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!('TEST TEXT')
      end

      it 'to not be valid' do
        fail!(nil)
        fail!('Test Text')
        fail!('TEST 123')
        fail!('TEST-TEXT')
      end
    end
  end

end
