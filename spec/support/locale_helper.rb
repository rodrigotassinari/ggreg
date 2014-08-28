RSpec.configure do |config|
  # pass `locale: :pt` to an example to run it with specific I18n translation
  config.around(:each) do |example|
    default_locale = I18n.default_locale
    if example.metadata[:locale]
      current_locale = example.metadata[:locale].to_sym
      raise RuntimeError.new,
        "unavailable locale: '#{current_locale}'" unless I18n.available_locales.include?(current_locale)
      I18n.locale = current_locale
      example.call
      I18n.locale = default_locale
    else
      # always set the locale to the system default between tests
      I18n.locale = default_locale
      example.call
      I18n.locale = default_locale
    end
  end
end

# Fixes http_accept_languege gem bug with rspec
# https://github.com/iain/http_accept_language/pull/19#commitcomment-3665690
def set_http_accept_language_header(value)
  allow(@controller).to receive(:http_accept_language).and_return(HttpAcceptLanguage::Parser.new(value))
end
