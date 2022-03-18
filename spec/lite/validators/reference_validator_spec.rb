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
        pass_assoc!(1)
        pass_assoc!('1')
      end

      it 'to not be valid' do
        fail_assoc!(nil)
        fail_assoc!('')
        fail_assoc!('Test')
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
        pass_assoc!(nil)
        pass_assoc!(1)
        pass_assoc!('1')
        pass_assoc!('')
      end

      it 'to not be valid' do
        fail_assoc!('Test')
      end
    end
  end

  context 'with polymorphic new record' do
    before do
      class ReferencePolymorphicNewRecordKlass < MockedKlass

        validates :input_id, reference: { polymorphic: true }

        def input
          nil
        end

      end
    end

    let(:klass) { ReferencePolymorphicNewRecordKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass_assoc!(1, 'Test')
        pass_assoc!('1', 'Test')
      end

      it 'to not be valid' do
        fail_assoc!(nil, nil)
        fail_assoc!('Test', 'Test')
        fail_assoc!(1, nil)
        fail_assoc!('1', nil)
        fail_assoc!(nil, 'Test')
      end
    end
  end

  context 'with polymorphic existing record' do
    before do
      class ReferencePolymorphicExistingRecordKlass < MockedKlass

        validates :input_id, reference: { polymorphic: true }

        def input
          self
        end

      end
    end

    let(:klass) { ReferencePolymorphicExistingRecordKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass_assoc!(nil, nil)
        pass_assoc!(nil, 'Test')
        pass_assoc!(1, 'Test')
        pass_assoc!('1', 'Test')
        pass_assoc!(1, nil)
        pass_assoc!('1', nil)
      end

      it 'to not be valid' do
        fail_assoc!('Test', 'Test')
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
        pass_assoc!(nil)
        pass_assoc!(1)
        pass_assoc!('1')
        pass_assoc!('')
      end

      it 'to not be valid' do
        fail_assoc!('Test')
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
