# see: https://github.com/sferik/twitter/tree/v4.6.2#configuration
if ENV['GGREG_SERVICE_TWITTER'] == 'enabled'
  ::Twitter.configure do |config|
    config.consumer_key = ENV['GGREG_TWITTER_CONSUMER_KEY']
    config.consumer_secret = ENV['GGREG_TWITTER_CONSUMER_SECRET']
    config.oauth_token = ENV['GGREG_TWITTER_OAUTH_TOKEN']
    config.oauth_token_secret = ENV['GGREG_TWITTER_OAUTH_TOKEN_SECRET']
  end
end
