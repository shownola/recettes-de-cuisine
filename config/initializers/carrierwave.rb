require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     ENV["AWS_ACCESS_KEY_ID"],
    aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
    region:                ENV['AWS_REGION']

  }
  config.fog_directory = ENV["S3_BUCKET_NAME"]
  config.fog_public    = false
  config.cache_dir     = "#{Rails.root}/tmp/uploads"
  config.storage       = :fog

end


# # if Rails.env.production?
#   CarrierWave.configure do |config|
#       config.fog_credentials = {
#         :provider => 'AWS',
#         :aws_access_key_id     => ENV['S3_ACCESS_KEY'],
#         :aws_secret_access_key => ENV['S3_SECRET_KEY'],
#         :region                => ENV['S3_REGION']
#       }
#       config.fog_directory = ENV['S3_bucket']
#       config.storage       = :fog
#     end
#   # end
