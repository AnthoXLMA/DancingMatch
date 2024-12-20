# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Rails.application.config.gem 'carrierwave', version: '~> 0.4.10'
Rails.application.config.gem 'cloudinary'
