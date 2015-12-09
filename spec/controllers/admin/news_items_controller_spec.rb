require "rails_helper"

RSpec.describe Admin::NewsItemsController, type: :controller do
  let(:admin) { FactoryGirl.create(:admin) }
  let(:valid_attributes) do
    attributes_for(:news_item).merge(published_by: nil)
  end

  describe "POST #create" do
    before do
      login_user(admin)
    end

    it "creates a new news_item" do
      expect do
        post :create, news_item: valid_attributes
      end.to change(NewsItem, :count).by(1)
    end

    it "assigns the current user to the 'published_by' field" do
      post :create, news_item: valid_attributes
      expect(NewsItem.last.published_by).to eq admin
    end
  end
end
