# frozen_string_literal: true

module Admin
  class LocationsController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # simply overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Location.all.paginate(10, params[:page])
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Location.find_by!(slug: param)
    # end

    # See https://administrate-docs.herokuapp.com/customizing_controller_actions
    # for more information

    private

    def order
      @_order ||= Administrate::Order.new(params.fetch(:order, :name),
                                          params.fetch(:direction, :asc))
    end
  end
end
