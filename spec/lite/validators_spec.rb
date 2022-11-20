# frozen_string_literal: true

RSpec.describe Lite::Validators do

  it "to be a version number" do
    expect(Lite::Validators::VERSION).not_to be_nil
  end

end
