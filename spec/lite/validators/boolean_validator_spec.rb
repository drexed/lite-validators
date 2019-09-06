# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BooleanValidator do
  before do
    class BooleanKlass < MockedKlass

      validates :input_0, boolean: true

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
  end

end
