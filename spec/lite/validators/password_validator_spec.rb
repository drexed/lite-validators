# frozen_string_literal: true

require 'spec_helper'

RSpec.describe PasswordValidator do

  context 'with base options' do
    before do
      class PasswordKlass < MockedKlass

        validates :input_0, password: true

      end
    end

    let(:klass) { PasswordKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!('p')
        pass!('passWORD')
        pass!('12345678')
        pass!('.,<>:;!@#$%^&*?_~-')
        pass!('passWORD1234.,<>:;!@#$%^&*?_~-')
      end

      it 'to not be valid' do
        fail!('pass word')
        fail!('pass\word')
      end
    end
  end

  context 'with invalid strength options' do
    before do
      class PasswordInvalidStrengthKlass < MockedKlass

        validates :input_0, password: { strength: :test }

      end
    end

    let(:klass) { PasswordInvalidStrengthKlass.new }

    describe '#validate' do
      it 'to raise ArgumentError' do
        expect { klass.valid? }.to raise_error(ArgumentError)
      end
    end
  end

  context 'with options { strength: :strong }' do
    before do
      class PasswordStrongKlass < MockedKlass

        validates :input_0, password: { strength: :strong }

      end
    end

    let(:klass) { PasswordStrongKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!('Pa$3')
        pass!('Pa$$word123')
      end

      it 'to not be valid' do
        fail!('pass')
        fail!('password')
        fail!('pass123')
        fail!('12345678')
        fail!('.,<>:;!@#$%^&*?_~-')
      end
    end
  end

end
