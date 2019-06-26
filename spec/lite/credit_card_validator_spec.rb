# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CreditCardValidator do

  context 'with base options' do
    before do
      class CreditCardKlass < MockedKlass

        validates :input, credit_card: true

      end
    end

    let(:klass) { CreditCardKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!(4_242_424_242_424_242)
        pass!('4242424242424242')
      end

      it 'to not be valid' do
        fail!(4242)
        fail!(7_242_424_242_424_242)
        fail!(4_242_424_242_424_241)
      end
    end
  end

  context 'with options { provider: :mastercard }' do
    before do
      class CreditCardMastercardKlass < MockedKlass

        validates :input, credit_card: { provider: :mastercard }

      end
    end

    let(:klass) { CreditCardMastercardKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!(5_555_555_555_554_444)
      end

      it 'to not be valid' do
        fail!(4_242_424_242_424_242)
        fail!(565_555_555_555_444)
        fail!(555_555_555_555_443)
        fail!(555_555_555_555_444)
      end
    end
  end

end
