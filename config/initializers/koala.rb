Koala.configure do |config|
  config.access_token = ENV["ACCESS_TOKEN"]
  config.app_access_token = ENV["APP_ACCESS_TOKEN"]
  config.app_id = ENV["APP_ID"]
  config.app_secret = ENV["APP_SECRET"]
end

FACEBOOK_GROUP_ID = ::ENV["FACEBOOK_GROUP_ID"] || raise('FACEBOOK_GROUP_ID ENV variable not set!')