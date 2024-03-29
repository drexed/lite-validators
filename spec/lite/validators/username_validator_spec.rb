# frozen_string_literal: true

require "spec_helper"

RSpec.describe UsernameValidator do
  before do
    class UsernameKlass < MockedKlass

      validates :input0, username: true

    end
  end

  let(:klass) { UsernameKlass.new }

  describe "#validate" do
    it "to be valid" do
      pass!("user-name_123")
    end

    it "to not be valid" do
      fail!(nil)
      fail!("username ")
      fail!("@username")
    end
  end

end
