FACEBOOK_GROUP_ID = ::ENV["FACEBOOK_GROUP_ID"] || raise('FACEBOOK_GROUP_ID ENV variable not set!')

Koala.configure do |config|
  config.app_id = ENV["APP_ID"]
  config.app_secret = ENV["APP_SECRET"]
  # config.access_token = AccessToken.find_by(name: 'page')&.value
  # config.app_access_token = AccessToken.find_by(name: 'app')&.value
end
