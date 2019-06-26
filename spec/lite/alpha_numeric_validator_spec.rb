# frozen_string_literal: true

require 'spec_helper'

RSpec.describe AlphaNumericValidator do

  context 'anycase without space (default)' do
    before do
      class AlphaNumeric1 < MockedUser
        validates :input, alpha_numeric: true
      end
    end

    let(:klass) { AlphaNumeric1.new }

    describe '#validate' do
      it 'to be valid will correct value' do
        klass.input = 'Test123'

        expect(klass).to be_valid
      end

      it 'to not be valid with nil' do
        klass.input = nil

        expect(klass).to_not be_valid
      end

      it 'to not be valid with space' do
        klass.input = 'Test 123'

        expect(klass).to_not be_valid
      end

      it 'to not be valid with dash' do
        klass.input = 'Test-123'

        expect(klass).to_not be_valid
      end
    end
  end

  context 'anycase with space' do
    before do
      class AlphaNumeric2 < MockedUser
        validates :input, alpha_numeric: { allow_space: true }
      end
    end

    let(:klass) { AlphaNumeric2.new }

    describe '#validate' do
      it 'to be valid will correct value' do
        klass.input = 'Test 123'

        expect(klass).to be_valid
      end

      it 'to not be valid with dash' do
        klass.input = 'Test-123'

        expect(klass).to_not be_valid
      end
    end
  end

  context 'lowercase without space' do
    before do
      class AlphaNumeric3 < MockedUser
        validates :input, alpha_numeric: { case: :lower }
      end
    end

    let(:klass) { AlphaNumeric3.new }

    describe '#validate' do
      it 'to be valid will correct value' do
        klass.input = 'test123'

        expect(klass).to be_valid
      end

      it 'to not be valid with dash' do
        klass.input = 'test-123'

        expect(klass).to_not be_valid
      end

      it 'to not be valid with space' do
        klass.input = 'test 123'

        expect(klass).to_not be_valid
      end

      it 'to not be valid with uppercase letter' do
        klass.input = 'Test123'

        expect(klass).to_not be_valid
      end
    end
  end

  context 'lowercase with space' do
    before do
      class AlphaNumeric4 < MockedUser
        validates :input, alpha_numeric: { case: :lower, allow_space: true }
      end
    end

    let(:klass) { AlphaNumeric4.new }

    describe '#validate' do
      it 'to be valid will correct value' do
        klass.input = 'test 123'

        expect(klass).to be_valid
      end

      it 'to not be valid with dash' do
        klass.input = 'Test-123'

        expect(klass).to_not be_valid
      end

      it 'to not be valid with uppercase letter' do
        klass.input = 'Test 123'

        expect(klass).to_not be_valid
      end
    end
  end

  context 'uppercase without space' do
    before do
      class AlphaNumeric5 < MockedUser
        validates :input, alpha_numeric: { case: :upper }
      end
    end

    let(:klass) { AlphaNumeric5.new }

    describe '#validate' do
      it 'to be valid will correct value' do
        klass.input = 'TEST123'

        expect(klass).to be_valid
      end

      it 'to not be valid with dash' do
        klass.input = 'TEST-123'

        expect(klass).to_not be_valid
      end

      it 'to not be valid with space' do
        klass.input = 'TEST 123'

        expect(klass).to_not be_valid
      end

      it 'to not be valid with lowercase letter' do
        klass.input = 'Test123'

        expect(klass).to_not be_valid
      end
    end
  end

  context 'uppercase with space' do
    before do
      class AlphaNumeric6 < MockedUser
        validates :input, alpha_numeric: { case: :upper, allow_space: true }
      end
    end

    let(:klass) { AlphaNumeric6.new }

    describe '#validate' do
      it 'to be valid will correct value' do
        klass.input = 'TEST 123'

        expect(klass).to be_valid
      end

      it 'to not be valid with dash' do
        klass.input = 'TEST-123'

        expect(klass).to_not be_valid
      end

      it 'to not be valid with lowercase letter' do
        klass.input = 'Test 123'

        expect(klass).to_not be_valid
      end
    end
  end

end
