# frozen_string_literal: true

require "rails_helper"

RSpec.describe NewsItem, type: :model do
  it_behaves_like "an author"

  describe ".published" do
    # Published
    let(:recent_item) { create(:news_item, :published) }
    let(:older_item) { create(:news_item, :published, published_at: 1.year.ago) }
    # Unpublished
    let(:archived_item) { create(:news_item, :archived) }
    let(:draft_item) { create(:news_item, :draft) }

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

  describe "validation" do
    subject { FactoryGirl.create(:news_item) }
    it { is_expected.to validate_presence_of(:state) }

    context "when published" do
      subject { FactoryGirl.create(:news_item, :published) }

      it { is_expected.to validate_presence_of(:published_at) }
      it { is_expected.to validate_presence_of(:title) }
      it do
        is_expected.to validate_length_of(:title).
          is_at_most(ActiveRecordExtensions::MAX_STRING_COLUMN_LENGTH)
      end
      it { is_expected.to validate_presence_of(:body) }
      it do
        is_expected.to validate_length_of(:body).
          is_at_most(ActiveRecordExtensions::MAX_TEXT_COLUMN_LENGTH)
      end
    end

    context "when draft" do
      subject { FactoryGirl.create(:news_item, :draft) }

      it { is_expected.to_not validate_presence_of(:published_at) }
      it { is_expected.to_not validate_presence_of(:title) }
      it { is_expected.to_not validate_presence_of(:body) }
    end

    context "for state" do
      NewsItem::STATES.each do |state|
        it "passes for value #{state}" do
          news_item = build(:news_item, state: state)
          expect(news_item).to be_valid
        end
      end
      it "fails for invalid value" do
        news_item = build(:news_item, state: "someinvalidvalue")
        expect(news_item).to_not be_valid
        expect(news_item.errors.messages[:state]).to be_present
      end
      it "fails for empty value" do
        news_item = build(:news_item, state: "")
        expect(news_item).to_not be_valid
        expect(news_item.errors.messages[:state]).to be_present
      end
      it "fails for not being present (nil value)" do
        news_item = build(:news_item, state: nil)
        expect(news_item).to_not be_valid
        expect(news_item.errors.messages[:state]).to be_present
      end
    end

    context "for published_at" do
      it "passes when published_at is present and the news item state is
          published" do
        news_item = build :news_item,
                          state: :published,
                          published_at: Date.yesterday
        expect(news_item).to be_valid
        expect(news_item.errors.messages[:published_at]).to_not be_present
      end
      it "fails when published_at is not present and the news item state is
          published" do
        news_item = build(:news_item, state: "published", published_at: nil)
        expect(news_item).to_not be_valid
        expect(news_item.errors.messages[:published_at]).to be_present
      end
      it "passes when published_at is not present and the news item state is
          other than published" do
        news_item = build(:news_item, state: "draft", published_at: nil)
        expect(news_item).to be_valid
        expect(news_item.errors.messages[:published_at]).to_not be_present
      end
      it "passes when published_at is not present and the news item state is
          nil" do
        news_item = build(:news_item, state: nil, published_at: nil)
        expect(news_item).to_not be_valid # state is nil
        expect(news_item.errors.messages[:published_at]).to_not be_present
      end
    end
  end
end
