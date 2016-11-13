require "rails_helper"

RSpec.describe Admin::EventsController, type: :controller do
  let(:admin) { FactoryGirl.create(:user, :admin) }
  let(:valid_attributes) do
    attributes_for(:event).merge(author: nil,
                                 location_id: create(:location).id)
  end

  describe "GET #index" do
    let(:events) { create_list(:event, 10) }
    before do
      login_user(admin)
    end

    it "status is ok" do
      get :index
      expect(response.status).to eq 200
    end
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
    let!(:event) { FactoryGirl.create(:event) }
    before do
      login_user(admin)
    end

    it "assigns the current user to the 'author' field" do
      put :update, id: event.id, event: event.attributes
      expect(event.reload.author).to eq admin
    end

    context "the event has a tweet value set to true" do
      let!(:event) { FactoryGirl.create(:event) }
      let(:valid_attributes) do
        attributes_for(:event).merge(tweet: true)
      end

      it "tweets" do
        allow(controller).to receive(:requested_resource) { event }
        expect(event).to receive(:tweet)
        put :update, id: event.id, event: valid_attributes
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:event) { FactoryGirl.create(:event) }
    before do
      login_user(admin)
    end

    context "success" do
      it "deletes an event" do
        expect do
          delete :destroy, id: event.id
        end.to change(Event, :count).by(-1)
        expect(response).to redirect_to admin_events_path
      end
    end
  end
end
