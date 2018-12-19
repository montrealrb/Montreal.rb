require 'rails_helper'

RSpec.describe Meetup::FetchEventsJob, type: :job do
  let(:job) { described_class.new }
  let(:mock_meetup_client) {
    Struct.new(:data) do
      def events(attrs = {})
        data[:events]
      end
    end
  }
  let!(:event) { create(:event, starts_at: 2.weeks.from_now.noon) }

  it 'attemps to reach the Meetup API' do
    expect(job).to receive(:meetup_client) {
      mock_meetup_client.new(events: {
        'results' => [
          { 'id' => 'foo', 'yes_rsvp_count' => 7,  'time' => (Time.zone.tomorrow.noon.to_i * 1000) },
          { 'id' => 'bar', 'yes_rsvp_count' => 13, 'time' => (1.month.from_now.noon.to_i * 1000) },
          { 'id' => 'baz', 'yes_rsvp_count' => 42, 'time' => (2.weeks.from_now.noon.to_i * 1000) }
        ],
        'meta' => []
      })
    }

    expect {
      job.perform
      event.reload
    }.to change(event, :rsvp_count).from(0).to(42)
  end
end
