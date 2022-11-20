# frozen_string_literal: true

require "csv" unless defined?(CSV)

class CsvValidator < FileSizeValidator

  DIMENSIONS = %i[
    columns rows
  ].freeze

  def validate_each(record, attribute, value)
    assert_valid_dimensions!
    assert_valid_checks!
    assign_attr_readers(record, attribute, csv_dimensions(value.path))
    valid?
  rescue CSV::MalformedCSVError
    record.errors.add(attribute, *error_message)
  end

  private

  # rubocop:disable Style/GuardClause
  def assert_valid_dimensions!
    if dimensions.empty?
      raise ArgumentError, "Missing atleast one dimension of #{DIMENSIONS.map(&:inspect).join(', ')} attribute for comparison."
    else
      assert_valid_option!(:dimensions, DIMENSIONS)
    end
  end
  # rubocop:enable Style/GuardClause

  def csv_dimensions(path)
    dimension = { columns: 0, rows: 0 }

    CSV.foreach(path) do |row|
      dimension[:columns] = row.size if dimension[:rows].zero?
      dimension[:rows] += 1
    end

    dimension
  end

  def checks
    dimension_options = options.slice(:columns, :rows).values
    dimension_options.flat_map(&:keys) & CHECKS.keys
  end

  def dimensions
    options.keys
  end

  def error_message_for(dimension, check, check_value)
    options[:message] || I18n.t(
      "errors.messages.csv.#{check}",
      **error_options(check_value).merge(dimension: dimension)
    )
  end

  def valid_attr?
    options.slice(*DIMENSIONS).each do |dimension, dimension_value|
      dimension_value.each do |check, check_value|
        validate_check(dimension, check, check_value)
      end
    end
  end

  def validate_check(dimension, check, check_value)
    return if valid_size?(value[dimension], check, check_value)

    record.errors.add(attribute, error_message_for(dimension, check, check_value))
  end

end
