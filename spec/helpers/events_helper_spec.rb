require 'rails_helper'

RSpec.describe EventsHelper do
  describe 'truncate_if_past' do
    context 'event is in the future' do
      let!(:event) { create :event, starts_at: 1.month.from_now, body: Faker::Lorem.words(300) }

      it 'does not truncate the text' do
        expect(truncate_if_past(event, event.body)).to eq event.body
      end
    end
  end
end
