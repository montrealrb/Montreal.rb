# frozen_string_literal: true
module Admin
  module AdministrateCustomization
    extend ActiveSupport::Concern

    private

    def resource_params
      super.merge(user_id: current_user.id)
    end
  end
end
