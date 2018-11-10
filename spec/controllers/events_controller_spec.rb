# frozen_string_literal: true

require "rails_helper"

RSpec.describe EventsController, type: :controller do
  let!(:proposed_event)  { create(:event, :proposed)  }
  let!(:scheduled_event) { create(:event, :scheduled, starts_at: Date.tomorrow) }
  let!(:past_event)      { create(:event, :scheduled, starts_at: 1.month.ago) }
  let!(:future_event)    { create(:event, :scheduled, starts_at: 1.month.from_now) }
  let!(:today_event)  { create :event, :scheduled, starts_at: DateTime.now}

  describe "GET #index" do
    before :each do
      get :index
    end

    it "returns a 200 status code" do
      expect(response).to have_http_status(200)
    end

    it "includes scheduled_event in response" do
      expect(assigns(:future_events)).to include scheduled_event
    end

    it "does not include proposed events" do
      expect(assigns(:past_events)).not_to   include proposed_event
      expect(assigns(:future_events)).not_to include proposed_event
      expect(assigns(:todays_event)).not_to include proposed_event
    end

    it "renders the :index template" do
      expect(response).to render_template :index
    end

    it "gets past events" do
      expect(assigns(:past_events)).to     include past_event
      expect(assigns(:past_events)).not_to include future_event
      expect(assigns(:past_events)).not_to include today_event

    end

    it "gets future events" do
      expect(assigns(:future_events)).to     include future_event
      expect(assigns(:future_events)).not_to include past_event
      expect(assigns(:future_events)).not_to include today_event
    end

    it "gets todays event" do
      expect(assigns(:todays_event)).to     include today_event
      expect(assigns(:todays_event)).not_to include past_event
      expect(assigns(:todays_event)).not_to include future_event

    end
  end

  describe "GET #show" do
    before :each do
      get :show, params: { id: scheduled_event.id }
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
