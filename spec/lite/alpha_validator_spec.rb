# frozen_string_literal: true

require 'spec_helper'

RSpec.describe AlphaValidator do

  context 'with anycase without space (default)' do
    before do
      class Alpha1 < MockedUser

        validates :input, alpha: true

      end
    end

    let(:klass) { Alpha1.new }

    describe '#validate' do
      it 'to be valid will correct value' do
        klass.input = 'Test'

        expect(klass).to be_valid
      end

      it 'to not be valid with nil' do
        klass.input = nil

        expect(klass).not_to be_valid
      end

      it 'to not be valid with space' do
        klass.input = 'Test '

        expect(klass).not_to be_valid
      end

      it 'to not be valid with dash' do
        klass.input = 'Test-'

        expect(klass).not_to be_valid
      end

      it 'to not be valid with numbers' do
        klass.input = 'Test123'

        expect(klass).not_to be_valid
      end
    end
  end

  context 'with anycase with space' do
    before do
      class Alpha2 < MockedUser

        validates :input, alpha: { allow_space: true }

      end
    end

    let(:klass) { Alpha2.new }

    describe '#validate' do
      it 'to be valid will correct value' do
        klass.input = 'Test '

        expect(klass).to be_valid
      end

      it 'to not be valid with dash' do
        klass.input = 'Test-'

        expect(klass).not_to be_valid
      end

      it 'to not be valid with numbers' do
        klass.input = 'Test123'

        expect(klass).not_to be_valid
      end
    end
  end

  context 'with lowercase without space' do
    before do
      class Alpha3 < MockedUser

        validates :input, alpha: { case: :lower }

      end
    end

    let(:klass) { Alpha3.new }

    describe '#validate' do
      it 'to be valid will correct value' do
        klass.input = 'test'

        expect(klass).to be_valid
      end

      it 'to not be valid with dash' do
        klass.input = 'test-'

        expect(klass).not_to be_valid
      end

      it 'to not be valid with space' do
        klass.input = 'test '

        expect(klass).not_to be_valid
      end

      it 'to not be valid with uppercase letter' do
        klass.input = 'Test'

        expect(klass).not_to be_valid
      end

      it 'to not be valid with numbers' do
        klass.input = 'test123'

        expect(klass).not_to be_valid
      end
    end
  end

  context 'with lowercase with space' do
    before do
      class Alpha4 < MockedUser

        validates :input, alpha: { case: :lower, allow_space: true }

      end
    end

    let(:klass) { Alpha4.new }

    describe '#validate' do
      it 'to be valid will correct value' do
        klass.input = 'test '

        expect(klass).to be_valid
      end

      it 'to not be valid with dash' do
        klass.input = 'Test-'

        expect(klass).not_to be_valid
      end

      it 'to not be valid with uppercase letter' do
        klass.input = 'Test '

        expect(klass).not_to be_valid
      end

      it 'to not be valid with numbers' do
        klass.input = 'test123'

        expect(klass).not_to be_valid
      end
    end
  end

  context 'with uppercase without space' do
    before do
      class Alpha5 < MockedUser

        validates :input, alpha: { case: :upper }

      end
    end

    let(:klass) { Alpha5.new }

    describe '#validate' do
      it 'to be valid will correct value' do
        klass.input = 'TEST'

        expect(klass).to be_valid
      end

      it 'to not be valid with dash' do
        klass.input = 'TEST-'

        expect(klass).not_to be_valid
      end

      it 'to not be valid with space' do
        klass.input = 'TEST '

        expect(klass).not_to be_valid
      end

      it 'to not be valid with lowercase letter' do
        klass.input = 'Test'

        expect(klass).not_to be_valid
      end

      it 'to not be valid with numbers' do
        klass.input = 'Test123'

        expect(klass).not_to be_valid
      end
    end
  end

  context 'with uppercase with space' do
    before do
      class Alpha6 < MockedUser

        validates :input, alpha: { case: :upper, allow_space: true }

      end
    end

    let(:klass) { Alpha6.new }

    describe '#validate' do
      it 'to be valid will correct value' do
        klass.input = 'TEST '

        expect(klass).to be_valid
      end

      it 'to not be valid with dash' do
        klass.input = 'TEST-'

        expect(klass).not_to be_valid
      end

      it 'to not be valid with lowercase letter' do
        klass.input = 'Test '

        expect(klass).not_to be_valid
      end

      it 'to not be valid with numbers' do
        klass.input = 'Test123'

        expect(klass).not_to be_valid
      end
    end
  end

end
