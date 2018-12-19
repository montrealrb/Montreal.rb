module Meetup
  class BaseJob < ApplicationJob
    queue_as :default

    protected
      def meetup_client
        @meetup_client ||= MeetupApi.new
      end

  end
end
