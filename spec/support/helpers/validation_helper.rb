# frozen_string_literal: true

module ValidationHelper

  def message?(*values, message: 'Input 0 is invalid')
    assign_klass_values(values)
    klass.valid?
    expect(klass.errors.full_messages.uniq.join(', ')).to eq(message)
  end

  def fail!(*values)
    assign_klass_values(values)
    expect(klass).not_to be_valid
  end

  def pass!(*values)
    assign_klass_values(values)
    expect(klass).to be_valid
  end

  private

  def assign_klass_values(values)
    values.each_with_index { |value, i| klass.send("input_#{i}=", value) }
  end

end
