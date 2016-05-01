module Admin
  class EventsController < Admin::ApplicationController
    include AdministrateCustomization

    def update
      super
      requested_resource.tweet if requested_resource.errors.none? && params[:event][:tweet]
    end
  end
end
