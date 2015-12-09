module Admin
  class JobsController < Admin::ApplicationController
    private

    def resource_params
      super.merge(user_id: current_user.id)
    end
  end
end
