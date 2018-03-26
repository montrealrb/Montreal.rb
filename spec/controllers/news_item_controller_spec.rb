# frozen_string_literal: true

require "rails_helper"

RSpec.describe NewsItemsController, type: :controller do
  describe "GET #index" do
    # Published
    let!(:recent_item) { create(:news_item, :published) }
    let!(:older_item) { create(:news_item, :published, published_at: 1.year.ago) }
    # Unpublished
    let!(:archived_item) { create(:news_item, :archived) }
    let!(:draft_item) { create(:news_item, :draft) }

    before :each do
      get :index
    end

    it "populates an array of news_items with the most recently published first" do
      expect(assigns(:news_items)).to match_array([recent_item, older_item])
    end

    it "does not show unpublished news_items" do
      expect(assigns(:news_items)).not_to include draft_item
    end

    it "does not show archived news_items" do
      expect(assigns(:news_items)).not_to include archived_item
    end

    it "renders the :index template" do
      expect(response).to render_template :index
    end

    it "renders gravatar images" do
      expect(response.body).to include('secure.gravatar.com/avatar/')
    end
  end

  describe "GET #show" do
    context "when accessing a published news_item" do
      let(:published_news_item) { create(:news_item, :published) }

      before :each do
        get :show, params: { id: published_news_item }
      end

      it "returns a 200 status code" do
        expect(response).to have_http_status(200)
      end

      it "assigns the requested news_item to @news_item" do
        expect(assigns(:news_item)).to eq published_news_item
      end

      it "renders the :show template" do
        expect(response).to render_template :show
      end
    end

    context "when clicking on a legacy link" do
      let(:slugged_news_item) { create(:news_item, :slugged, :published) }

      it "finds that legacy post" do
        get :show, params: { year: 2014, month: 10, slug: slugged_news_item.slug }
        expect(response).to have_http_status(200)
      end
    end

    context "when accessing a non-published news_item" do
      let(:archived_news_item) { create(:news_item, :archived) }
      let(:draft_news_item) { create(:news_item, :draft) }

      it "raises a RecordNotFound error" do
        [draft_news_item, archived_news_item].each do |news_item|
          expect do
            get :show, params: { id: news_item }
          end.to raise_error ActiveRecord::RecordNotFound
        end
      end
    end
  end
end
