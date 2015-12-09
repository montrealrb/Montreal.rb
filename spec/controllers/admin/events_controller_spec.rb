require "rails_helper"

RSpec.describe Admin::EventsController, type: :controller do
  let(:admin) { FactoryGirl.create(:admin) }
  let(:valid_attributes) do
    attributes_for(:event).merge(published_by: nil,
                                 location_id: create(:location).id)
  end

  describe "POST #create" do
    before do
      login_user(admin)
    end

    it "creates a new event" do
      expect do
        post :create, event: valid_attributes
      end.to change(Event, :count).by(1)
    end

    it "assigns the current user to the 'published_by' field" do
      post :create, event: valid_attributes
      expect(Event.last.published_by).to eq admin
    end
  end
end
