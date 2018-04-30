# frozen_string_literal: true

require "rails_helper"

RSpec.describe PagesController, type: :controller do
  context "when accessing a published page" do
    let(:published_page) { create(:page, :published) }

    it "returns a 200 status code" do
      get :show, params: { id: published_page }
      expect(response).to have_http_status(200)
    end
  end

  context "when accessing a non-published page" do
    let(:draft_page) { create(:page, :draft) }
    let(:archived_page) { create(:page, :draft) }

    it "raises a RecordNotFound error" do
      [draft_page, archived_page].each do |page|
        expect do
          get :show, params: { id: page }
        end.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end
end
