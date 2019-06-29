# frozen_string_literal: true

require 'spec_helper'

RSpec.describe TimeZoneValidator do

  context 'with base options' do
    before do
      class TimeZoneKlass < MockedKlass

        validates :input_0, time_zone: true

      end
    end

    let(:klass) { TimeZoneKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!('London')
        pass!('America/New_York')
      end

      it 'to not be valid' do
        fail!('America/Miami')
        fail!('Atlanta')
      end
    end
  end

end
