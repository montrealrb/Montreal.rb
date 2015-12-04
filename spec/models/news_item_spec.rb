require 'rails_helper'

RSpec.describe NewsItem, type: :model do
  describe 'validation' do
    it {should validate_presence_of(:title)}
    it {should validate_length_of(:title).is_at_most(255)}
    it {should validate_presence_of(:body)}
    it {should validate_length_of(:body).is_at_most(4000)}
    context 'for state' do
      NewsItem::AVAILABLE_STATES.each do |state|
        it "passes for value #{state}" do
          news_item = NewsItem.new(title: 'title', body: 'body', state: state, published_at: Date.yesterday)
          expect(news_item).to be_valid
        end
      end
      it "fails for invalid value" do
        news_item = NewsItem.new(title: 'title', body: 'body', state: "someinvalidvalue", published_at: Date.yesterday)
        expect(news_item).to_not be_valid
        expect(news_item.errors.messages[:state]).to be_present
      end
      it "fails for empty value" do
        news_item = NewsItem.new(title: 'title', body: 'body', state: "", published_at: Date.yesterday)
        expect(news_item).to_not be_valid
        expect(news_item.errors.messages[:state]).to be_present
      end
      it "fails for not being present (nil value)" do
        news_item = NewsItem.new(title: 'title', body: 'body', state: nil, published_at: Date.yesterday)
        expect(news_item).to_not be_valid
        expect(news_item.errors.messages[:state]).to be_present
      end
    end
    context 'for published_at' do
      it 'passes when published_at is present and the news item state is published' do
        news_item = NewsItem.new(title: 'title', body: 'body', state: :published, published_at: Date.yesterday)
        expect(news_item).to be_valid
        expect(news_item.errors.messages[:published_at]).to_not be_present
      end
      it 'fails when published_at is not present and the news item state is published' do
        news_item = NewsItem.new(title: 'title', body: 'body', state: 'published', published_at: nil)
        expect(news_item).to_not be_valid
        expect(news_item.errors.messages[:published_at]).to be_present
      end
      it 'passes when published_at is not present and the news item state is other than published' do
        news_item = NewsItem.new(title: 'title', body: 'body', state: 'draft', published_at: nil)
        expect(news_item).to be_valid #state is nil
        expect(news_item.errors.messages[:published_at]).to_not be_present
      end
      # this one was a bug discovered (but not reported) on Dec 4, 2015 relating to state
      # value of nil crashing the published_at validation when submitting a new news item
      # with nothing filled in, despite having a state presence validation since both
      # validations run anyways.
      it 'passes when published_at is not present and the news item state is nil' do
        news_item = NewsItem.new(title: 'title', body: 'body', state: nil, published_at: nil)
        expect(news_item).to_not be_valid #state is nil
        expect(news_item.errors.messages[:published_at]).to_not be_present
      end
    end
  end
end
