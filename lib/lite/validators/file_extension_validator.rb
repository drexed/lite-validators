# frozen_string_literal: true

class FileExtensionValidator < BaseValidator

  def validate_each(record, attribute, value)
    assert_valid_include_or_exclude!
    assign_attr_readers(record, attribute, value)
    valid?
  end

  private

  def assert_valid_include_or_exclude!
    return if options.key?(:include) || options.key?(:exclude)

    raise ArgumentError, 'Missing ":include" or ":exclude" attribute for comparison.'
  end

  def check
    options.key?(:exclude) ? :exclude : :include
  end

  def include_or_exclude
    values = options[:include] || options[:exclude]
    [*values]
  end

  # rubocop:disable Metrics/AbcSize
  def valid_attr?
    extension = File.extname(value.original_filename).tr('.', '')
    return false if extension.empty?

    included = include_or_exclude.any? { |ext| ext.to_s == extension }
    included = !included if check == :exclude
    return if included

    record.errors.add(attribute, check || options[:message], types: include_or_exclude.join(', '))
  end
  # rubocop:enable Metrics/AbcSize

end
