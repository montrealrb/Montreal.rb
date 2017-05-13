# frozen_string_literal: true
require "rails_helper"

RSpec.describe JobsController, type: :controller do
  let(:draft_job) { create(:job, :draft) }
  let(:published_job) { create(:job, :published) }
  let(:archived_job) { create(:job, :archived) }
  let(:matching_title_job) { create(:job, :published, title: "FooBar") }
  let(:matching_description_job) { create(:job, :published, description: "FooBar") }
  let(:not_matching_job) { create(:job, :published, title: "Bob", description: "Lisa") }

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

    context "with a search query" do
      before :each do
        get :index, q: "foobar"
      end

      it "includes job when the query matches its title" do
        expect(assigns(:jobs)).to include matching_title_job
      end

      it "includes job when the query matches its description" do
        expect(assigns(:jobs)).to include matching_description_job
      end

      it "does not include job when the query does not match title nor description" do
        expect(assigns(:jobs)).not_to include not_matching_job
      end
    end
  end

  describe "GET #show" do
    before :each do
      get :show, id: published_job.id
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
            get :show, id: job
          end.to raise_error ActiveRecord::RecordNotFound
        end
      end
    end

    it "renders the :show template" do
      expect(response).to render_template :show
    end
  end
end
