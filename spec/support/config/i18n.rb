# frozen_string_literal: true

path = File.expand_path('../../../config/locales/en.yml', File.dirname(__FILE__))
I18n.load_path << path unless I18n.load_path.include?(path)
I18n.enforce_available_locales = false
