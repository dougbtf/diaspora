class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :grid_fs

  def store_dir
    "files/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  version :thumb_small do
    process :resize_to_fill => [30,30]
  end

  version :thumb_medium do
    process :resize_to_fill => [100,100]
  end
end