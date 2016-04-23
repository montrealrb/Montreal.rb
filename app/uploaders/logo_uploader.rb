# encoding: utf-8

class LogoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process convert: "png"

  version :standard do
    resize_to_fit(300, 700)
  end

  version :thumbnail do
    resize_to_fit(100, 100)
  end

  def extension_white_list
    %w(jpg jpeg gif png).freeze
  end
end
