# frozen_string_literal: true

require "rails_helper"

RSpec.describe Admin::NewsItemsController, type: :controller do
  let(:admin) { create(:user, :admin) }
  let(:valid_attributes) do
    attributes_for(:news_item).merge(author: nil)
  end
  before do
    login_user(admin)
  end


  describe "GET #index" do
    it "status is ok" do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "POST #create" do
    it "creates a new news_item" do
      expect do
        post :create, params: { news_item: valid_attributes }
      end.to change(NewsItem, :count).by(1)
    end

    it "assigns the current user to the 'author' field" do
      post :create, params: { news_item: valid_attributes }
      expect(NewsItem.last.author).to eq admin
    end
  end

  describe "PUT #update" do
    let(:news_item) { create :news_item }

    it "assigns the current user to the 'author' field" do
      put :update, params: { id: news_item.id, news_item: news_item.attributes }
      expect(news_item.reload.author).to eq admin
    end
  end
end
