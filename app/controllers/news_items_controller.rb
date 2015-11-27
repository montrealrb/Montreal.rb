class NewsItemsController < ApplicationController
  def index
    @news_items = NewsItem.published.to_a
  end
end
