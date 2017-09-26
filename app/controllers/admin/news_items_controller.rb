# frozen_string_literal: true

module Admin
  class NewsItemsController < Admin::ApplicationController
    include AdministrateCustomization

    private

    def order
      @_order ||= Administrate::Order.new(params.fetch(:order, :published_at),
                                          params.fetch(:direction, :desc))
    end
  end
end
