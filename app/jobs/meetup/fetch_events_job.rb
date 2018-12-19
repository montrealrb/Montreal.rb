module Meetup
  class FetchEventsJob < BaseJob

    def perform(from_time=Time.now.beginning_of_day, to_time=nil)
      @from_time = from_time
      @to_time = to_time

      fetch_events.each do |meetup_event|
        time = DateTime.strptime(meetup_event['time'].to_s, '%Q').in_time_zone
        if event = Event.where(starts_at: (time - 1.day)..(time + 1.day)).sort_by{|e| (e.starts_at - time).abs}.first
          event.update rsvp_count: meetup_event['yes_rsvp_count']
        end
      end
    end

    private
      def fetch_events
        @events ||= begin
          timestamp_range = [(@from_time.to_i * 1000), (@to_time ? @to_time.to_i * 1000 : nil)].compact.join(',')
          data = meetup_client.events({ group_urlname: ENV['MEETUP_URLNAME'], status: 'upcoming,past', time: timestamp_range })
          data['results']
        end
      end

  end
end
