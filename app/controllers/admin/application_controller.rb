# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_filters.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_admin

    def authenticate_admin
      return handle_unauthenticated_user unless current_user.present?
      handle_unauthorized_user unless current_user.admin?
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end

    private

    def handle_unauthenticated_user
      unauthenticated_user_flash
      redirect_to new_user_session_path
    end

    def handle_unauthorized_user
      unauthorized_user_flash
      redirect_to root_path
    end

    def unauthenticated_user_flash
      flash[:alert] = "Be a good guest now, you should not go there!"
    end

    def unauthorized_user_flash
      flash[:alert] = "Sorry, you just don't have access rights!"
    end
  end
end
