# frozen_string_literal: true

require "rails_helper"
require "carrierwave/test/matchers"

describe LogoUploader do
  include CarrierWave::Test::Matchers

  let(:organization) { create :organization }
  let(:uploader)     { LogoUploader.new(organization, :logo) }

  before do
    LogoUploader.enable_processing = true
    test_image_file = "spec/fixtures/rainbow_unicorn.jpg"

  end

  after do
    LogoUploader.enable_processing = false
    organization.remove_logo!
    organization.save
    uploader.remove!
  end

  describe "only allows certin file formats" do
    it do
      is_expected.to respond_to :extension_white_list
    end

    it "white list is set to image formats" do
      expect(uploader.extension_white_list).to eq %w(jpg jpeg gif png)
    end
  end

  context "the thumb version" do
    subject { uploader.thumbnail }

    it "should scale an image to be fill 100 by 100 pixels" do
      expect(subject.transformation[:width]).to  eq 100
      expect(subject.transformation[:height]).to eq 100
    end

    it "should be the correct format" do
      expect(subject.format).to eq("png")
    end
  end

  context "the standard version" do
    subject { uploader.standard }

    it "should scale an image to be fill 300 by 700 pixels" do
      expect(subject.transformation[:width]).to  eq 300
      expect(subject.transformation[:height]).to eq 700
    end

    it "should be the correct format" do
      expect(subject.format).to eq("png")
    end
  end

  it "should be the correct format" do
    expect(uploader.format).to eq("png")
  end
end
