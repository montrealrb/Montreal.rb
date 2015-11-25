class NewsItemsController < ApplicationController
  def index
    @news_items = NewsItem.all
  end
end
