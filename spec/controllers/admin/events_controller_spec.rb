require "rails_helper"

RSpec.describe Admin::EventsController, type: :controller do
  let(:admin) { FactoryGirl.create(:user, :admin) }
  let(:valid_attributes) do
    attributes_for(:event).merge(author: nil,
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

    it "assigns the current user to the 'author' field" do
      post :create, event: valid_attributes
      expect(Event.last.author).to eq admin
    end
  end

  describe "PUT #update" do
    let(:event) { create :event }
    before do
      login_user(admin)
    end

    it "assigns the current user to the 'author' field" do
      put :update, id: event.id, event: event.attributes
      expect(event.reload.author).to eq admin
    end
  end
end
