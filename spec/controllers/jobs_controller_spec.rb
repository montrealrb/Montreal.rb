# frozen_string_literal: true
require "rails_helper"

RSpec.describe JobsController, type: :controller do
  let(:draft_job) { create(:job, :draft) }
  let(:published_job) { create(:job, :published) }
  let(:archived_job) { create(:job, :archived) }

  describe "GET #index" do
    before :each do
      get :index
    end

    it "returns a 200 status code" do
      expect(response).to have_http_status(200)
    end

    it "includes published_job in response" do
      expect(assigns(:jobs)).to include published_job
    end

    it "does not include unpublished in jobs" do
      expect(assigns(:jobs)).not_to include draft_job
    end

    it "does not include archived in jobs" do
      expect(assigns(:jobs)).not_to include archived_job
    end

    it "renders the :index template" do
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    before :each do
      get :show, params: { id: published_job.id }
    end

    it "returns a 200 status code" do
      expect(response).to have_http_status(200)
    end

    it "assigns the requested published_job to @job" do
      expect(assigns(:job)).to eq published_job
    end

    context "when accessing a non-published news_item" do
      it "raises a RecordNotFound error" do
        [draft_job, archived_job].each do |job|
          expect do
            get :show, params: { id: job }
          end.to raise_error ActiveRecord::RecordNotFound
        end
      end
    end

    it "renders the :show template" do
      expect(response).to render_template :show
    end
  end
end
