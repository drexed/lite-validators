# frozen_string_literal: true

require 'spec_helper'

RSpec.describe UrlValidator do

  context 'with base options' do
    before do
      class UrlKlass < MockedKlass

        validates :input_0, url: true

      end
    end

    let(:klass) { UrlKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!('http://example.com')
        pass!('http://FooBar.cOm')
        pass!('https://example.net/index.html')
        pass!('https://example.travel/')
        pass!('http://beta.example.aero?foo=bar')
        pass!('ftp://example.com')
      end

      it 'to not be valid' do
        fail!('://example.com')
      end
    end
  end

  context 'with options { domain: [:com, "org"] }' do
    before do
      class UrlDomainKlass < MockedKlass

        validates :input_0, url: { domain: [:com, 'org'] }

      end
    end

    let(:klass) { UrlDomainKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!('http://example.com')
        pass!('http://example.org')
      end

      it 'to not be valid' do
        fail!('http://example.biz')
      end

      it 'to be a "Input 0 has an invalid domain" error message' do
        message?('http://example.biz', message: 'Input 0 has an invalid domain')
      end
    end
  end

  context 'with options { scheme: :http }' do
    before do
      class UrlSchemeKlass < MockedKlass

        validates :input_0, url: { scheme: :http }

      end
    end

    let(:klass) { UrlSchemeKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!('http://example.com')
      end

      it 'to not be valid' do
        fail!('https://example.com')
        fail!('ftp://example.com')
      end

      it 'to be a "Input 0 has an invalid scheme" error message' do
        message?('ftp://example.com', message: 'Input 0 has an invalid scheme')
      end
    end
  end

  context 'with options { root_only: true }' do
    before do
      class UrlRootOnlyKlass < MockedKlass

        validates :input_0, url: { root_only: true }

      end
    end

    let(:klass) { UrlRootOnlyKlass.new }

    describe '#validate' do
      it 'to be valid' do
        pass!('http://example.com')
        pass!('http://example.com/')
      end

      it 'to not be valid' do
        fail!('example.com')
        fail!('http://example.com/test')
        fail!('http://example.com#test')
        fail!('http://example.com?a=b')
      end

      it 'to be a "Input 0 has a url path but shouldnt" error message' do
        message?('http://example.com/test', message: "Input 0 has a url path but shouldn't")
      end
    end
  end

end
