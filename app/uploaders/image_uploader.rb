class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  process resize_to_fit: [1024, 768]

  def extension_white_list
    %w[jpg jpeg gif png]
  end

  def cache_dir
    "#{Rails.root}/tmp/uploads"
  end

  def filename
    if original_filename
      @name ||= Digest::MD5.hexdigest(Time.current.to_s + File.dirname(current_path))
      "#{@name}.#{file.extension}"
    end
  end

  version :thumb do
    process resize_to_fit: [32, 32]
  end

  version :preview do
    process resize_to_fit: [128, 128]
  end
end
