# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ReferenceValidator do

  context 'with new record' do
    before do
      class ReferenceNewRecordKlass < MockedKlass

        validates :input_id, reference: true

        def input
          nil
        end

      end
    end

    let(:klass) { ReferenceNewRecordKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass_id!(1)
        pass_id!('1')
      end

      it 'to not be valid' do
        fail_id!(nil)
        fail_id!('')
        fail_id!('Test')
      end
    end
  end

  context 'with existing record' do
    before do
      class ReferenceExistingRecordKlass < MockedKlass

        validates :input_id, reference: true

        def input
          self
        end

      end
    end

    let(:klass) { ReferenceExistingRecordKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass_id!(nil)
        pass_id!(1)
        pass_id!('1')
        pass_id!('')
      end

      it 'to not be valid' do
        fail_id!('Test')
      end
    end
  end

  context 'with association option' do
    before do
      class ReferenceAssociationOptionKlass < MockedKlass

        validates :input_id, reference: { association: :other_input }

        def input
          nil
        end

        def other_input
          self
        end

      end
    end

    let(:klass) { ReferenceAssociationOptionKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass_id!(nil)
        pass_id!(1)
        pass_id!('1')
        pass_id!('')
      end

      it 'to not be valid' do
        fail_id!('Test')
      end
    end
  end

  context 'with invalid option' do
    before do
      class ReferenceInvalidOptionKlass < MockedKlass

        validates :input_id, reference: { association: :other_input }

      end
    end

    let(:klass) { ReferenceInvalidOptionKlass.new }

    describe '#validate' do
      it 'to raise NoMethodError' do
        expect { klass.valid? }.to raise_error(NoMethodError)
      end
    end
  end

end
