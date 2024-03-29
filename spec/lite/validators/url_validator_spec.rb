# frozen_string_literal: true

require "spec_helper"

RSpec.describe UrlValidator do

  context "with base options" do
    before do
      class UrlKlass < MockedKlass

        validates :input0, url: true

      end
    end

    let(:klass) { UrlKlass.new }

    describe "#validate" do
      it "to be valid" do
        pass!("http://example.com")
        pass!("http://FooBar.cOm")
        pass!("https://example.net/index.html")
        pass!("https://example.travel/")
        pass!("http://beta.example.aero?foo=bar")
        pass!("ftp://example.com")
      end

      it "to not be valid" do
        fail!(nil)
        fail!("://example.com")
      end
    end
  end

  context 'with options { include_host: ["example", "sample.com"] }' do
    before do
      class UrlIncludeHostKlass < MockedKlass

        validates :input0, url: { include_host: ["example", "sample.com"] }

      end
    end

    let(:klass) { UrlIncludeHostKlass.new }

    describe "#validate" do
      it "to be valid" do
        pass!("http://example.com")
        pass!("http://example.net")
        pass!("http://sample.com")
      end

      it "to not be valid" do
        fail!(nil)
        fail!("http://test.com")
        fail!("http://sample.org")
      end

      it 'to be a "Input0 has an invalid host" error message' do
        message?("http://test.com", message: "Input0 has an invalid host")
      end
    end
  end

  context 'with options { exclude_host: ["example", "sample.com"] }' do
    before do
      class UrlExcludeHostKlass < MockedKlass

        validates :input0, url: { exclude_host: ["example", "sample.com"] }

      end
    end

    let(:klass) { UrlExcludeHostKlass.new }

    describe "#validate" do
      it "to be valid" do
        pass!("http://test.com")
        pass!("http://sample.org")
      end

      it "to not be valid" do
        fail!(nil)
        fail!("http://example.com")
        fail!("http://example.net")
        fail!("http://sample.com")
      end

      it 'to be a "Input0 has an invalid host" error message' do
        message?("http://example.com", message: "Input0 has an invalid host")
      end
    end
  end

  context 'with options { domain: [:com, "org"] }' do
    before do
      class UrlDomainKlass < MockedKlass

        validates :input0, url: { domain: [:com, "org"] }

      end
    end

    let(:klass) { UrlDomainKlass.new }

    describe "#validate" do
      it "to be valid" do
        pass!("http://example.com")
        pass!("http://example.org")
      end

      it "to not be valid" do
        fail!(nil)
        fail!("http://example.biz")
      end

      it 'to be a "Input0 has an invalid domain" error message' do
        message?("http://example.biz", message: "Input0 has an invalid domain")
      end
    end
  end

  context "with options { scheme: :http }" do
    before do
      class UrlSchemeKlass < MockedKlass

        validates :input0, url: { scheme: :http }

      end
    end

    let(:klass) { UrlSchemeKlass.new }

    describe "#validate" do
      it "to be valid" do
        pass!("http://example.com")
      end

      it "to not be valid" do
        fail!(nil)
        fail!("https://example.com")
        fail!("ftp://example.com")
      end

      it 'to be a "Input0 has an invalid scheme" error message' do
        message?("ftp://example.com", message: "Input0 has an invalid scheme")
      end
    end
  end

  context "with options { root_only: true }" do
    before do
      class UrlRootOnlyKlass < MockedKlass

        validates :input0, url: { root_only: true }

      end
    end

    let(:klass) { UrlRootOnlyKlass.new }

    describe "#validate" do
      it "to be valid" do
        pass!("http://example.com")
        pass!("http://example.com/")
      end

      it "to not be valid" do
        fail!(nil)
        fail!("example.com")
        fail!("http://example.com/test")
        fail!("http://example.com#test")
        fail!("http://example.com?a=b")
      end

      it 'to be a "Input0 has a url path but shouldnt" error message' do
        message?("http://example.com/test", message: "Input0 has a url path but shouldn't")
      end
    end
  end

end
