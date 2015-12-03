class NewsItemsController < ApplicationController
  def index
    @news_items = news_item_scope.to_a
  end

  def show
    @news_item = news_item_scope.where(slug: params[:slug]).first ||
                 news_item_scope.where(id: params[:id]).first ||
                 raise(ActiveRecord::RecordNotFound)
  end

  private

  def news_item_scope
    NewsItem.published
  end
end
