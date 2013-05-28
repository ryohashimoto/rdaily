# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :fog

  def cache_dir
    "#{Rails.root}/tmp/uploads"
  end
  
  version :thumb do
    process :resize_to_fit => [32, 32]
  end

  version :preview do
    process :resize_to_fit => [128, 128]
  end

  version :full do
    process :resize_to_fit => [1024, 768]
  end
end
