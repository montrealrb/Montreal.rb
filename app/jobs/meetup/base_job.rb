module Meetup
  class BaseJob < ApplicationJob
    queue_as :default

    def perform
      raise Exception.new('Your class needs to implement #perform')
    end

    protected
      def meetup_client
        @meetup_client ||= MeetupApi.new
      end

  end
end
