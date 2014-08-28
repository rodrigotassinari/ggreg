APIMatchers.setup do |config|
  config.http_status_method = :status
end

RSpec.configure do |config|
  config.include APIMatchers::RSpecMatchers
end
