# frozen_string_literal: true

require 'spec_helper'

RSpec.describe HexValidator do
  before do
    class HexKlass < MockedKlass

      validates :input0, hex: true

    end
  end

  let(:klass) { HexKlass.new }

  describe '#validate' do
    it 'to be valid' do
      pass!('a9A')
      pass!('a9A9a9')
      pass!('#a9A')
      pass!('#a9A9a9')
    end

    it 'to not be valid' do
      fail!(nil)
      fail!('#')
      fail!('a')
      fail!('a9')
      fail!('a9A9')
      fail!('a9A9a')
      fail!('a9A9a9a')
      fail!('h9H')
      fail!('#h9Hh9H')
    end
  end

end
