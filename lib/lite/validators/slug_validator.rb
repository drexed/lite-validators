# frozen_string_literal: true

class SlugValidator < BaseValidator

  REGEXP ||= %r{^[A-Za-z0-9_-]+$}i.freeze

end
