# frozen_string_literal: true

require "rails_helper"

RSpec.describe Admin::MyEventsController, type: :controller do
  let(:admin) { create(:user, :admin) }
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
        post :create, params: { event: valid_attributes }
      end.to change(Event, :count).by(1)
    end

    it "assigns the current user to the 'organizer' field" do
      post :create, params: { event: valid_attributes }
      expect(Event.last.organizer).to eq admin.member
    end
  end

  describe "PUT #update" do
    let!(:event) { create(:event, organizer: admin.member) }

    before do
      login_user(admin)
    end

    it "assigns the current user to the 'author' field" do
      put :update, params: { id: event.id, event: event.attributes }
      expect(Event.last.organizer).to eq admin.member
    end
  end

  describe "DELETE #destroy" do
    let!(:event) { create(:event) }
    before do
      login_user(admin)
    end

    context "success" do
      it "deletes an event" do
        expect do
          delete :destroy, params: { id: event.id }
        end.to change(Event, :count).by(-1)
        expect(response).to redirect_to admin_events_path
      end
    end

    context "when cannot unlink all the talks" do
      it "displays a flag message" do
        allow(Event).to receive(:find).and_return(event)
        expect(event).to receive(:unlink_all_talks).and_return(false)

        delete :destroy, params: { id: event.id }

        expect(flash[:error]).to eq("Could not delete event ##{event.id}")
      end
    end
  end
end

