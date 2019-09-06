# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EinValidator do
  before do
    class EinKlass < MockedKlass

      validates :input_0, ein: true

    end
  end

  let(:klass) { EinKlass.new }

  describe '#validate' do
    it 'to be valid' do
      pass!('55-5555555')
      pass!('1-2345678')
    end

    it 'to not be valid' do
      fail!(nil)
      fail!('my-einnumb')
      fail!('00-1111111')
      fail!('5-55555')
    end
  end

end
