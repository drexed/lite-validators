# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BooleanValidator do

  context 'with invalid check options' do
    before do
      class BooleanInvalidCheckKlass < MockedKlass

        validates :input0, boolean: { check: :test }

      end
    end

    let(:klass) { BooleanInvalidCheckKlass.new }

    describe '#validate' do
      it 'to raise ArgumentError' do
        expect { klass.valid? }.to raise_error(ArgumentError)
      end
    end
  end

  context 'with base options' do
    before do
      class BooleanKlass < MockedKlass

        validates :input0, boolean: true

      end
    end

    let(:klass) { BooleanKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!(true)
        pass!(false)
        pass!('true')
        pass!('false')
        pass!(1)
        pass!(0)
        pass!('1')
        pass!('0')
      end

      it 'to not be valid' do
        fail!(nil)
        fail!('test')
        fail!('2')
      end

      it 'to be a "Input0 must be a true or false value" error message' do
        message?(nil, message: 'Input0 must be a true or false value')
      end
    end
  end

  context 'with options { check: :true_only }' do
    before do
      class BooleanTrueKlass < MockedKlass

        validates :input0, boolean: { check: :true_only }

      end
    end

    let(:klass) { BooleanTrueKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!(true)
        pass!('true')
        pass!(1)
        pass!('1')
      end

      it 'to not be valid' do
        fail!(false)
        fail!('false')
        fail!(0)
        fail!('0')
        fail!(nil)
        fail!('test')
        fail!('2')
      end

      it 'to be a "Input0 must be a true value" error message' do
        message?(nil, message: 'Input0 must be a true value')
      end
    end
  end

  context 'with options { check: :false_only }' do
    before do
      class BooleanFalseKlass < MockedKlass

        validates :input0, boolean: { check: :false_only }

      end
    end

    let(:klass) { BooleanFalseKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!(false)
        pass!('false')
        pass!(0)
        pass!('0')
      end

      it 'to not be valid' do
        fail!(true)
        fail!('true')
        fail!(1)
        fail!('1')
        fail!(nil)
        fail!('test')
        fail!('2')
      end

      it 'to be a "Input0 must be a false value" error message' do
        message?(nil, message: 'Input0 must be a false value')
      end
    end
  end

end
