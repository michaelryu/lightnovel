# encoding: utf-8

class PictureUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick
  
  process resize_to_fit: [300, 450]
  process resize_to_fill: [300, 450]

  version :thumb do
    process resize_to_fill: [150, 225]
  end

  def default_url
    'default.png'
  end

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
