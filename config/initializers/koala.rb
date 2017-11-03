Koala.configure do |config|
  config.app_id = ENV["APP_ID"]
  config.app_secret = ENV["APP_SECRET"]
end

FACEBOOK_GROUP_ID = ::ENV["FACEBOOK_GROUP_ID"] || raise('FACEBOOK_GROUP_ID ENV variable not set!')


Thread.new do
  loop do

    Koala.configure do |config|
      config.access_token = AccessToken.find_by(name: 'page')&.value
      config.app_access_token = AccessToken.find_by(name: 'app')&.value
    end

    sleep(60)

  end
end

