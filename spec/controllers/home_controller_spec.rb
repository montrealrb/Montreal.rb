require "rails_helper"

RSpec.describe EventsController, type: :controller do
  let!(:proposed_event)  { create :event, :proposed  }
  let!(:past_event)      { create :event, :scheduled, starts_at: 1.month.ago }
  let!(:future_event)    { create :event, :scheduled, starts_at: 1.month.from_now }

  describe '#index' do
    before do
      get :index
    end

    it { is_expected.to respond_with 200 }

    it 'does not get proposed events' do
      expect(assigns(:past_events)).not_to   include proposed_event
      expect(assigns(:future_events)).not_to include proposed_event
    end

    it 'gets past events' do
      expect(assigns(:past_events)).to     include past_event
      expect(assigns(:past_events)).not_to include future_event
    end

    it 'gets future events' do
      expect(assigns(:future_events)).to     include future_event
      expect(assigns(:future_events)).not_to include past_event
    end
  end
end

