require "carrierwave/test/matchers"

describe LogoUploader do
  include CarrierWave::Test::Matchers

  before do
    LogoUploader.enable_processing = true
    @uploader = LogoUploader.new

    test_image_file = "spec/fixtures/rainbow_unicorn.jpg"

    @uploader.store!(File.open(test_image_file))
  end

  after do
    LogoUploader.enable_processing = false
    @uploader.remove!
  end

  describe "only allows certin file formats" do
    it do
      is_expected.to respond_to :extension_white_list
    end

    it "white list is set" do
      pending
      fail
    end

    it "fails to upload raw file" do
      pending
      fail
    end
  end

  context "the thumb version" do
    it "should scale down a landscape image to be exactly 64 by 64 pixels" do
      pending
      @uploader.thumb.should have_dimensions(64, 64)
    end
  end

  context "the standard version" do
    it "should scale an image to be fill 100 by 150 pixels" do
      pending
      @uploader.thumb.should have_dimensions(100, 150)
    end
  end

  it "should be the correct format" do
    pending "can't find the method .format"
    expect(@uploader).to be_format("png")
  end
end
