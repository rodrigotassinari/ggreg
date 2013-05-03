# Runs the test suite multiple times, one for each available locale
# see: https://simplesideias.com.br/garantindo-a-consistencia-das-traducoes-no-rails
desc "Run localized specs"
task "spec:i18n" => :environment do
  I18n.available_locales.each do |locale|
    ENV["LOCALE"] = locale.to_s
    Rake::Task["spec"].reenable
    Rake::Task["spec"].invoke
  end
end
