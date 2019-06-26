# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CoordinateValidator do

  context 'with base options' do
    before do
      class CoordinateKlass < MockedKlass

        validates :input, coordinate: true

      end
    end

    let(:klass) { CoordinateKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!(%w[90 180])
        pass!([90, 180])
        pass!([-90.0, -180.0])
      end

      it 'to not be valid' do
        fail!([90, 181])
        fail!([-90.1, -180.0])
      end
    end
  end

  context 'with options { boundary: :latitude }' do
    before do
      class CoordinateLatitudeKlass < MockedKlass

        validates :input, coordinate: { boundary: :latitude }

      end
    end

    let(:klass) { CoordinateLatitudeKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!('90')
        pass!(90)
        pass!(-90.0)
      end

      it 'to not be valid' do
        fail!(91)
        fail!(-90.1)
      end
    end
  end

  context 'with options { boundary: :longitude }' do
    before do
      class CoordinateLongitudeKlass < MockedKlass

        validates :input, coordinate: { boundary: :longitude }

      end
    end

    let(:klass) { CoordinateLongitudeKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!('180')
        pass!(180)
        pass!(-180.0)
      end

      it 'to not be valid' do
        fail!(181)
        fail!(-180.1)
      end
    end
  end

end
