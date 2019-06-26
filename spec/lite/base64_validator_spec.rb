# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Base64Validator do
  before do
    class Base64Klass < MockedKlass

      validates :input, base64: true

    end
  end

  let(:klass) { Base64Klass.new }

  describe '#validate' do
    it 'to be valid' do
      klass.input = 'YW55IGNhcm5hbCBwbGVhcw=='
      expect(klass).to be_valid

      klass.input = 'YW55IGNhcm5hbCBwbGVhc3U='
      expect(klass).to be_valid

      klass.input = 'YW55IGNhcm5hbCBwbGVhc3Vy'
      expect(klass).to be_valid

      klass.input = 'YW55IGNhcm5hbCBwbGVhc3VyZQ=='
      expect(klass).to be_valid

      klass.input = 'YW55IGNhcm5hbCBwbGVhc3VyZS4='
      expect(klass).to be_valid
    end

    it 'to not be valid' do
      klass.input = '1ab2=='
      expect(klass).not_to be_valid
    end
  end

end
