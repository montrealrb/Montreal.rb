# frozen_string_literal: true

MyEvent = Event
module Admin
  class MyEventsController < EventsController
    include AdministrateCustomization

    def scoped_resource
      resource_class
        .includes(:translations)
        .where(organizer: current_user.member)
        .where('starts_at > ?', 1.month.ago)
    end

    private

    def resource_params
      super.merge(organizer_id: current_user.member.id)
    end
  end
end
