# frozen_string_literal: true

require "rails_helper"

RSpec.describe Admin::JobsController, type: :controller do
  let(:admin) { create(:user, :admin) }
  let(:valid_attributes) { attributes_for(:job).merge(author: nil) }

  describe "GET #index" do
    before { login_user(admin) }

    it "orders by specific field and direction" do
      get :index, params: { order: :created_at, direction: :asc }

      expect(assigns(:_order).as_json).to(
        eq("attribute" => "created_at", "direction" => "asc")
      )
    end
  end

  describe "POST #create" do
    before do
      login_user(admin)
    end

    it "creates a new job" do
      expect do
        post :create, params: { job: valid_attributes }
      end.to change(Job, :count).by(1)
    end

    it "assigns the current user to the 'author' field" do
      post :create, params: { job: valid_attributes }
      expect(Job.last.author).to eq admin
    end
  end

  describe "PUT #update" do
    let(:job) { create :job }
    before do
      login_user(admin)
    end

    it "assigns the current user to the 'author' field" do
      put :update, params: { id: job.id, job: job.attributes }
      expect(job.reload.author).to eq admin
    end
  end
end
