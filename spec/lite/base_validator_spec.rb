# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BaseValidator do
  before do
    class BaseKlass < MockedKlass

      validates :input, alpha: true

    end
  end

  let(:klass) { BaseKlass.new }

  describe '#validate' do
    it 'to not be valid' do
      klass.input = nil
      expect(klass).not_to be_valid

      klass.input = ''
      expect(klass).not_to be_valid

      klass.input = ' '
      expect(klass).not_to be_valid
    end
  end

end
