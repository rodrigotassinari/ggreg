# encoding: utf-8
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :fakeweb
  c.ignore_localhost = true
  c.default_cassette_options = { :record => :once }
  c.configure_rspec_metadata!
end

RSpec.configure do |config|

  # so we can use `:vcr` rather than `:vcr => true`;
  # in RSpec 3 this will no longer be necessary.
  config.treat_symbols_as_metadata_keys_with_true_values = true

  # Enable VCR for tests with :vcr => true
  config.around(:each, :vcr => true) do |example|
    name = example.metadata[:full_description].gsub(/\W+/, "_").split("_", 2).join("/").underscore
    VCR.use_cassette(name, :record => :new_episodes) do
      example.call
    end
  end

end
