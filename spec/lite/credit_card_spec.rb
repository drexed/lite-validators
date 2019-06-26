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
        pass!(4242424242424242)
        pass!('4242424242424242')
      end

      it 'to not be valid' do
        fail!(4242)
        fail!(7242424242424242)
        fail!(4242424242424241)
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
        pass!(5555555555554444)
      end

      it 'to not be valid' do
        fail!(4242424242424242)
        fail!(565555555555444)
        fail!(555555555555443)
        fail!(555555555555444)
      end
    end
  end

end
