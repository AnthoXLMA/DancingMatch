require 'cloudinary'

Cloudinary.config_from_url("cloudinary://947717511563492:BYJ-euBcX9Ik2EorjeOUASyUHBg@hnnyhemvj")

Cloudinary.config do |config|
  config.cloud_name = 'hnnyhemvj'
  config.api_key = '947717511563492'
  config.api_secret = 'BYJ-euBcX9Ik2EorjeOUASyUHBg'
  config.secure = true
end
