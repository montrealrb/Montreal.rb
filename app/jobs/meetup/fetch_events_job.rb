module Meetup
  class FetchEventsJob < BaseJob

    def perform()
      fetch_events['results'].each do |event|
        # TODO: find the closest event (event['time'])
        #       update events rsvp count count (event['yes_rsvp_count']);
        #       possibly store the Meetup ID? (event['id'])
      end
    end

    private
      def fetch_events
        @events ||= meetup_client.events({ group_urlname: ENV['MEETUP_URLNAME'], status: 'upcoming,past', time: "#{Time.now.beginning_of_month.to_i * 1000},#{Time.now.end_of_month.to_i * 1000}" })
      end

  end
end
