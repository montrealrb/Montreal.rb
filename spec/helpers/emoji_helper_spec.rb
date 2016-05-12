require "rails_helper"

include ERB::Util

RSpec.describe EmojiHelper do

  describe "supports emojis" do
    emoji_path = "<img alt=\"see_no_evil\" src=\"/images/emoji/unicode/1f648.png\" style=\"vertical-align:middle\" width=\"20\" height=\"20\" />"
    context "emojis are in the body" do
      let!(:event){ create :event, body: ":see_no_evil:"}

      it "replaces the keys with emojis images" do
        expect(emojify(event.body)).to eq emoji_path
      end
    end

    context "emoji keys are in the title" do
      let!(:event){create :event, title: ":see_no_evil:"}
      it "properly handles emojis in the title after a call to titleize" do
        puts "TITLE: #{emojify(event.title.titleize)}"
        expect(emojify(event.title.titleize)).to eq emoji_path
      end
    end
  end
end

