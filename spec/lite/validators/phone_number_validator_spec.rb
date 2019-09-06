# frozen_string_literal: true

require 'spec_helper'

RSpec.describe PhoneNumberValidator do
  before do
    class PhoneNumberKlass < MockedKlass

      validates :input_0, phone_number: true

    end
  end

  let(:klass) { PhoneNumberKlass.new }

  describe '#validate' do
    it 'to be valid' do
      pass!(1_234_567)
      pass!('1234567')
      pass!('123-4567')
      pass!('123 4567')
      pass!('5551234567')
      pass!('555-123-4567')
      pass!('555 123 4567')
      pass!('(555) 123-4567')
      pass!('(555) 123-4567 ext 1234')
      pass!('(555) 123-4567 ext1234')
      pass!('(555) 123-4567 ext-1234')
      pass!('1-555-123-4567')
      pass!('+1-555-123-4567')
      pass!('+1 (555) 123-4567 ext-1234')
    end

    it 'to not be valid' do
      fail!(nil)
      fail!('123_4567')
      fail!('(555) 123-4567 ext:1234')
    end
  end

end
