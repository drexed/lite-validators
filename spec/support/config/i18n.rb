# frozen_string_literal: true

path = File.expand_path('../../../lib/lite/validators/locales/en.yml', File.dirname(__FILE__))
I18n.enforce_available_locales = true
I18n.load_path << path
I18n.reload!
