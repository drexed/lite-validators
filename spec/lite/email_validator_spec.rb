# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EmailValidator do

  context 'with base options' do
    before do
      class EmailKlass < MockedKlass

        validates :input, email: true

      end
    end

    let(:klass) { EmailKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!('user@test.ly')
        pass!('user@test.com')
        pass!('User.+_-123@beta.test-site.Com')
      end

      it 'to not be valid' do
        fail!('user')
        fail!('user@')
        fail!('user@com')
        fail!('user@test.')
        fail!('user@test.c')
        fail!('@com')
        fail!('@test.com')
        fail!('user@test.com ')
        fail!(' user@test.com')
        fail!(' user@test.com ')
      end
    end
  end

  context 'with options { domain: "com" }' do
    before do
      class EmailSingleDomainKlass < MockedKlass

        validates :input, email: { domain: 'com' }

      end
    end

    let(:klass) { EmailSingleDomainKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!('user@test.com')
      end

      it 'to not be valid' do
        fail!('user@test.ly')
      end
    end
  end

  context 'with options { domain: %w[com org] }' do
    before do
      class EmailMultipleDomainsKlass < MockedKlass

        validates :input, email: { domain: %w[com org] }

      end
    end

    let(:klass) { EmailMultipleDomainsKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!('user@test.com')
        pass!('user@test.org')
      end

      it 'to not be valid' do
        fail!('user@test.ly')
      end
    end
  end

end
