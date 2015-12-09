require "rails_helper"

RSpec.describe NewsItem, type: :model do

  describe ".published" do
    # Published
    let(:recent_item) { create(:news_item) }
    let(:older_item) { create(:news_item, published_at: 1.year.ago) }
    # Unpublished
    let(:archived_item) { create(:archived_news_item) }
    let(:draft_item) { create(:draft_news_item) }

    it "returns a sorted array of most recently published items first" do
      expect(NewsItem.published).to eq [recent_item, older_item]
    end

    it "does not return archived items" do
      expect(NewsItem.published).not_to include archived_item
    end

    it "does not return draft items" do
      expect(NewsItem.published).not_to include draft_item
    end
  end

  describe "attribute validations" do
    it "does not validate when 'published_by' is not defined" do
      news_item = NewsItem.new(published_by: nil)
      expect(news_item).to be_invalid
      expect(news_item.errors.messages.keys).to include :published_by
    end
  end

  context "when a news_item is published" do
    it "knows about its publisher" do
      publisher = create(:user)
      news_item = create(:news_item, published_by: publisher)
      expect(news_item.published_by).to eq publisher
    end
  end
end
