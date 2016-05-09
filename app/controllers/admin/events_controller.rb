module Admin
  class EventsController < Admin::ApplicationController
    include AdministrateCustomization

    def update
      tweet = params[:event].delete(:tweet)
      super
      requested_resource.tweet if requested_resource.errors.none? && tweet
    end
  end
end
