# frozen_string_literal: true

require "rails_helper"

RSpec.describe Admin::NewsItemsController, type: :controller do
  let(:admin) { FactoryGirl.create(:user, :admin) }
  let(:valid_attributes) do
    attributes_for(:news_item).merge(author: nil)
  end

  describe "POST #create" do
    before do
      login_user(admin)
    end

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
    before do
      login_user(admin)
    end

    it "assigns the current user to the 'author' field" do
      put :update, params: { id: news_item.id, news_item: news_item.attributes }
      expect(news_item.reload.author).to eq admin
    end
  end
end
