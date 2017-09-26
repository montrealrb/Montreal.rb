# frozen_string_literal: true

module Admin
  class TalksController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # simply overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Talk.all.paginate(10, params[:page])
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Talk.find_by!(slug: param)
    # end

    # See https://administrate-docs.herokuapp.com/customizing_controller_actions
    # for more information

    private

    def order
      @_order ||= Administrate::Order.new(params.fetch(:order, :created_at),
                                          params.fetch(:direction, :desc))
    end
  end
end
