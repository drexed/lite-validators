# frozen_string_literal: true

module ValidationHelper

  def fail!(*values)
    values.each_with_index { |value, i| klass.send("input_#{i}=", value) }
    expect(klass).not_to be_valid
  end

  def pass!(*values)
    values.each_with_index { |value, i| klass.send("input_#{i}=", value) }
    expect(klass).to be_valid
  end

end
