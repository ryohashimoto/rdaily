CarrierWave.configure do |config|
  if Rails.env.test?
    config.storage = :file
    config.enable_processing = false
    config.root = "#{Rails.root}/tmp"
  else
    if ENV["RDAILY_IMAGE_STORAGE"] == "s3"
      config.storage = :fog
      config.fog_credentials = {
        provider: "AWS",
        aws_access_key_id: ENV["RDAILY_AWS_ACCESS_KEY_ID"],
        aws_secret_access_key: ENV["RDAILY_AWS_SECRET_ACCESS_KEY"],
        region: ENV["RDAILY_AWS_REGION"]
      }
      config.fog_directory = ENV["AWS_S3_BUCKET_NAME"]
    else
      config.storage = :file
      config.permissions = 0o666
      config.directory_permissions = 0o777
    end
  end
  config.cache_dir = "#{Rails.root}/tmp/uploads"
end
