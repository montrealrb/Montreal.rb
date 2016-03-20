require 'rails_helper'

RSpec.describe EventsHelper do
  include FontAwesome::Sass::Rails::ViewHelpers

  describe 'truncate_if_past' do
    context 'event is in the past' do
      let!(:event) { create :event, starts_at: 1.month.ago, body: Faker::Lorem.words(500) }

      it 'truncates the text' do
        expect(truncate_if_past(event, event.body)).to include truncate(event.body, length: 300, omission: ' ', separator: ' ')
      end

      it 'links to the event' do
        expect(truncate_if_past(event, event.body)).to match /<a href=\"\/events\/\d+.+\">.+<\/a>/
      end
    end

    context 'event is in the future' do
      let!(:event) { create :event, starts_at: 1.month.from_now, body: Faker::Lorem.words(300) }

      it 'does not truncate the text' do
        expect(truncate_if_past(event, event.body)).to eq event.body
      end
    end
  end
end
