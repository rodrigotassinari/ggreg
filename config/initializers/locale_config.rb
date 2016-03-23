Rails.env.on(:any) do
  config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
  config.i18n.available_locales = [:en, :pt]
  config.i18n.default_locale = :en
end
I18n.enforce_available_locales = true # http://stackoverflow.com/a/20381730
