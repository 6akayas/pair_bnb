# ***config/initializers/storage.rb***

CarrierWave.configure do |config|
  config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV["aws_access_id"],
      aws_secret_access_key: ENV["aws_access_secret_key"],
      region: 'ap-southeast-1'
  }
  config.fog_directory  = "pairbnbuploader"
  config.fog_public     = false
end
