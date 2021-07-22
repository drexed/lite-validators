# frozen_string_literal: true

module Lite
  module Validators
    class Railtie < Rails::Railtie

      initializer 'lite-validators.configure_locales' do |app|
        Array(app.config.i18n.available_locales).each do |locale|
          path = File.expand_path("../../../locales/#{locale}.yml", __FILE__)
          next unless File.file?(path)

          I18n.load_path << path
        end

        I18n.reload!
      end

    end
  end
end
