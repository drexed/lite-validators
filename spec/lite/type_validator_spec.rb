# frozen_string_literal: true

require 'spec_helper'

RSpec.describe TypeValidator do

  context 'with invalid is options' do
    before do
      class TypeInvalidIsKlass < MockedKlass

        validates :input_0, type: true

      end
    end

    let(:klass) { TypeInvalidIsKlass.new }

    describe '#validate' do
      it 'to raise ArgumentError' do
        expect { klass.valid? }.to raise_error(ArgumentError)
      end
    end
  end

  context 'with options { is: Array }' do
    before do
      class TypeArrayKlass < MockedKlass

        validates :input_0, type: { is: Array }

      end
    end

    let(:klass) { TypeArrayKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!([])
      end

      it 'to not be valid' do
        fail!(1)
        fail!('test')
        fail!({})
        fail!(true)
        fail!(false)
      end
    end
  end

  context 'with options { is: Boolean }' do
    before do
      class TypeBooleanKlass < MockedKlass

        validates :input_0, type: { is: Boolean }

      end
    end

    let(:klass) { TypeBooleanKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!(true)
        pass!(false)
      end

      it 'to not be valid' do
        fail!(1)
        fail!('test')
        fail!({})
        fail!([])
      end
    end
  end

  context 'with options { is: CustomKlass }' do
    before do
      class CustomKlass; end

      class TypeCustomKlass < MockedKlass

        validates :input_0, type: { is: CustomKlass }

      end
    end

    let(:klass) { TypeCustomKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!(CustomKlass.new)
      end

      it 'to not be valid' do
        fail!(1)
        fail!('test')
        fail!({})
        fail!([])
        fail!(true)
        fail!(false)
      end
    end
  end

end