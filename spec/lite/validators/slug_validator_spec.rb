# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SlugValidator do
  before do
    class SlugKlass < MockedKlass

      validates :input0, slug: true

    end
  end

  let(:klass) { SlugKlass.new }

  describe '#validate' do
    it 'to be valid' do
      pass!('Slug-12_34')
    end

    it 'to not be valid' do
      fail!(nil)
      fail!('slug 1234')
      fail!('slug+1234')
    end
  end

end
