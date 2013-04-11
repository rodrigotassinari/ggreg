# encoding: utf-8

RSpec.configure do |config|

  # Enable Timecope for tests with :timecop => true
  config.around(:each, :timecop => true) do |example|
    Timecop.freeze(Time.now) do
      example.call
    end
  end

end
