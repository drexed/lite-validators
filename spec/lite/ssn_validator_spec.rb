# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SsnValidator do
  before do
    class SsnKlass < MockedKlass

      validates :input_0, ssn: true

    end
  end

  let(:klass) { SsnKlass.new }

  describe '#validate' do
    it 'to be valid' do
      pass!(333_224_444)
      pass!('333224444')
      pass!('333-22-4444')
    end

    it 'to not be valid' do
      fail!('333 22 4444')
      fail!('333-22-444a')
    end
  end

end
