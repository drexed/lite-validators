# frozen_string_literal: true

module ValidationHelper

  def message?(*values, message: 'Input0 is invalid')
    assign_klass_values(values)
    klass.valid?
    expect(klass.errors.full_messages.uniq.join(', ')).to eq(message)
  end

  def fail!(*values)
    assign_klass_values(values)
    expect(klass).not_to be_valid
  end

  def fail_id!(id)
    assign_klass_id(id)
    expect(klass).not_to be_valid
  end

  def pass!(*values)
    assign_klass_values(values)
    expect(klass).to be_valid
  end

  def pass_id!(id)
    assign_klass_id(id)
    expect(klass).to be_valid
  end

  private

  def assign_klass_id(value)
    klass.input_id = value
  end

  def assign_klass_values(values)
    values.each_with_index { |value, i| klass.public_send("input#{i}=", value) }
  end

end
