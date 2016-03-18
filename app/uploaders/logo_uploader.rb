# encoding: utf-8

class LogoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process convert: "png"

  version :standard do
    process resize_to_fill: [100, 150, :north]
  end

  version :thumbnail do
    resize_to_fit(50, 50)
  end

  def extension_white_list
    %w(jpg jpeg gif png).freeze
  end
end
