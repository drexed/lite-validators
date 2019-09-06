# frozen_string_literal: true

require 'spec_helper'

RSpec.describe IsinValidator do
  before do
    class IsinKlass < MockedKlass

      validates :input_0, isin: true

    end
  end

  let(:klass) { IsinKlass.new }

  describe '#validate' do
    it 'to be valid' do
      pass!('AU0000XVGZA3')
      pass!('US0378331005')
    end

    it 'to not be valid' do
      fail!(nil)
      fail!('US03783310055')
      fail!('US037833100')
      fail!('US03783315')
      fail!('AA0000XVGZA3')
      fail!('120378331004')
    end
  end

end
