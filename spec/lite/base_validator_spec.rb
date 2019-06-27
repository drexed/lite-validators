# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BaseValidator do
  before do
    class BaseKlass < MockedKlass

      validates :input_0, alpha: true

    end
  end

  let(:klass) { BaseKlass.new }

  describe '#validate' do
    it 'to not be valid' do
      fail!(nil)
      fail!('')
      fail!(' ')
    end
  end

end
