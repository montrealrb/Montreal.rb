require "rails_helper"

RSpec.describe Admin::JobsController, type: :controller do
  let(:admin) { FactoryGirl.create(:admin) }
  let(:valid_attributes) { attributes_for(:job).merge(published_by: nil) }

  describe "POST #create" do
    before do
      login_user(admin)
    end

    it "creates a new job" do
      expect do
        post :create, job: valid_attributes
      end.to change(Job, :count).by(1)
    end

    it "assigns the current user to the 'published_by' field" do
      post :create, job: valid_attributes
      expect(Job.last.published_by).to eq admin
    end
  end
end
