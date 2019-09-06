# frozen_string_literal: true

require 'spec_helper'

RSpec.describe NameValidator do
  before do
    class NameKlass < MockedKlass

      validates :input_0, name: true

    end
  end

  let(:klass) { NameKlass.new }

  describe '#validate' do
    it 'to be valid' do
      pass!('First Last')
      pass!('First Last-Name')
      pass!('First Middle Last')
      pass!("Sur First Middle O'Last Maiden")
    end

    it 'to not be valid' do
      fail!(nil)
      fail!('First')
      fail!('First 123')
      fail!('Title Sur First Middle Last Maiden')
    end
  end

end
