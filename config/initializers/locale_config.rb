Rails.application.config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
Rails.application.config.i18n.available_locales = [:en, :pt]
Rails.application.config.i18n.default_locale = :en
I18n.enforce_available_locales = true # http://stackoverflow.com/a/20381730
