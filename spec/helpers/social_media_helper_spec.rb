# frozen_string_literal: true
require "rails_helper"

RSpec.describe SocialMediaHelper do
  include FontAwesome::Sass::Rails::ViewHelpers

  describe "social_media_link_for" do
    subject(:built_link) { social_media_link_for(:facebook) }

    it "returns a link" do
      expect(built_link).to include('<a target="_blank" href="https://www.facebook.com')
    end

    context "with a 'with_icon: true' parameter" do
      subject(:built_link) { social_media_link_for(:facebook, with_icon: true) }

      it "returns a link with an icon" do
        expect(built_link).to include('<i class="fa fa-facebook"></i>')
      end
    end

    context "when the type provided is not supported" do
      it "raises an ArgumentError" do
        expect { social_media_link_for(:unknown_social_media) }.to raise_error(ArgumentError)
      end
    end
  end
end
