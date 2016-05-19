module Admin
  class NewsItemsController < Admin::ApplicationController
    include AdministrateCustomization
    def update
      tweet = params[:news_item].delete(:tweet)
      super
      requested_resource.tweet if requested_resource.errors.none? && tweet
    end
  end
end
