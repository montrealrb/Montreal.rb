module Admin
  class JobsController < Admin::ApplicationController
    include AdministrateCustomization
    def update
      tweet = params[:job].delete(:tweet)
      super
      requested_resource.tweet if requested_resource.errors.none? && tweet
    end
  end
end
