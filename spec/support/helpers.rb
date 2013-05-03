RSpec.configure do |config|
  config.include Module.new {

    # alias to I18n#t
    # see: https://simplesideias.com.br/garantindo-a-consistencia-das-traducoes-no-rails
    def _(*args, &block)
      I18n.t(*args, &block)
    end

    # alias to I18n#l
    # see: https://simplesideias.com.br/garantindo-a-consistencia-das-traducoes-no-rails
    def _l(*args, &block)
      I18n.l(*args, &block)
    end

  }
end
