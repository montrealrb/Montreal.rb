# frozen_string_literal: true
require "rails_helper"

RSpec.describe UsersHelper, type: :helper do
  describe "avatar_for" do
    let!(:member)     { create :member, picture: "/image.jpg" }
    let(:gravatar_id) { Digest::MD5.hexdigest(member.email.downcase) }

    it "add an alt tag" do
      expect(avatar_for(member)).to include "alt=\"#{member.name}\""
    end

    it "supports html options" do
      expect(avatar_for(member, html: { class: "gravatar" })).to include 'class="gravatar"'
    end

    it "points the picture" do
      expect(avatar_for(member, size: 100)).to include member.picture
    end

    context "when member does not have a picture" do
      let!(:member) { create :member, picture: nil }
      let(:test) { "src=\"https://secure.gravatar.com/avatar/#{gravatar_id}?s=100\"" }

      it "generates the right image tag from gravatar" do
        expect(avatar_for(member, size: 100)).to include test
      end
    end
  end
end
