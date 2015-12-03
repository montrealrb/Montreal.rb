require 'rails_helper'

RSpec.describe NewsItemsController, type: :controller do

  context "when accessing a published news_item" do
    let(:published_news_item) { create :news_item, state: "published" }

    it "returns a 200 status code" do
      get :show, id: published_news_item
      expect(response).to have_http_status(200)
    end
  end

  context "when accessing a non-published news_item" do
    let(:draft_news_item) { create :news_item, state: "draft" }
    let(:archived_news_item) { create :news_item, state: "draft" }

    it "raises a RecordNotFound error" do
      [draft_news_item, archived_news_item].each do |news_item|
        expect do
          get :show, id: news_item
        end.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end
end
