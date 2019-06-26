# frozen_string_literal: true

module ValidationHelper

  def fail!(value)
    klass.input = value
    expect(klass).not_to be_valid
  end

  def pass!(value)
    klass.input = value
    expect(klass).to be_valid
  end

end
