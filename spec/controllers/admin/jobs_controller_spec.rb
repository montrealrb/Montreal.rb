# frozen_string_literal: true
require "rails_helper"

RSpec.describe Admin::JobsController, type: :controller do
  let(:admin) { FactoryGirl.create(:user, :admin) }
  let(:valid_attributes) { attributes_for(:job).merge(author: nil) }

  describe "POST #create" do
    before do
      login_user(admin)
    end

    it "creates a new job" do
      expect do
        post :create, job: valid_attributes
      end.to change(Job, :count).by(1)
    end

    it "assigns the current user to the 'author' field" do
      post :create, job: valid_attributes
      expect(Job.last.author).to eq admin
    end
  end

  describe "PUT #update" do
    let(:job) { create :job }
    before do
      login_user(admin)
    end

    it "assigns the current user to the 'author' field" do
      put :update, id: job.id, job: job.attributes
      expect(job.reload.author).to eq admin
    end
  end
end
