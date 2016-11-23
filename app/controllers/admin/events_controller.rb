module Admin
  class EventsController < Admin::ApplicationController
    include AdministrateCustomization

    def destroy
      @event = Event.find(params[:id])
      unless @event.unlink_all_talks
        flash[:error] = "Could not delete event ##{@event.id}"
      end
      redirect_to admin_events_path
    end

    def update
      tweet = params[:event].delete(:tweet)
      super
      requested_resource.tweet if requested_resource.errors.none? && tweet
    end
  end
end
