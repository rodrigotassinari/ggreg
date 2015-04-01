# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :twitter_integration do
    # configuration '{"consumer_key": "ck","consumer_secret": "cs","access_token": "at","access_token_secret": "ats"}'
    consumer_key "ck"
    consumer_secret "cs"
    access_token "at"
    access_token_secret "ats"
  end
end
