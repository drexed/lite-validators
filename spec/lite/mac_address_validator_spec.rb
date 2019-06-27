# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MacAddressValidator do
  before do
    class MacAddressKlass < MockedKlass

      validates :input_0, mac_address: true

    end
  end

  let(:klass) { MacAddressKlass.new }

  describe '#validate' do
    it 'to be valid' do
      pass!('08:00:2b:01:02:03')
      pass!('08-00-2b-01-02-03')
      pass!('08.00.2b.01.02.03')
      pass!('08 00 2b 01 02 03')
      pass!('08002b:010203')
      pass!('08002b-010203')
      pass!('08002b.010203')
      pass!('08002b-010203')
      pass!('0800:2b01:0203')
      pass!('0800.2b01.0203')
      pass!('0800-2b01-0203')
      pass!('0800 2b01 0203')
      pass!('08002b010203')
    end

    it 'to not be valid' do
      fail!('08:00:2b:01:02')
      fail!('08-00-2b-01-02')
      fail!('08:00:2b:01:02:03:04')
      fail!('qq:00:00:00:00:00')
    end
  end

end
