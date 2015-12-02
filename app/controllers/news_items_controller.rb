class NewsItemsController < ApplicationController
  def index
    @news_items = NewsItem.published.to_a
  end

  def show
    @news_item = NewsItem.published.find(params[:id])
  end
end
