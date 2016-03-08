require "rails_helper"

RSpec.describe EventsController, type: :controller do
  let(:proposed_event)  { create(:event, :proposed)  }
  let(:scheduled_event) { create(:event, :scheduled) }

  describe "GET #index" do
    before :each do
      get :index
    end

    it "returns a 200 status code" do
      expect(response).to have_http_status(200)
    end

    it "includes scheduled_event in response" do
      expect(assigns(:events)).to include scheduled_event
    end

    it "does not include proposed in events" do
      expect(assigns(:events)).not_to include proposed_event
    end

    it "renders the :index template" do
      expect(response).to render_template :index
    end
  end

  describe "GET #index" do
    before :each do
      get :show, id: scheduled_event.id
    end

    it "returns a 200 status code" do
      expect(response).to have_http_status(200)
    end

    it "finds the event" do
      expect(assigns(:event)).to eq scheduled_event
    end

    it "renders the :show template" do
      expect(response).to render_template :show
    end
  end
end

