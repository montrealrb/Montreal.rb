class NewsItemsController < ApplicationController
  def index
    @news_items = news_item_scope.to_a
  end

  # TODO: See Issue #151
  # If `params[:slug]` is present, it's *most probably* coming from a
  # wordpress legacy link.
  # When the legacy data was imported, we also stored that original `slug`
  # and this is why we first try to load an event_item using that param.
  #
  def show
    @news_item = news_item_scope.where(slug: params[:id]).first ||
                 news_item_scope.where(id: params[:id]).first ||
                 raise(ActiveRecord::RecordNotFound)
  end

  private

  def news_item_scope
    NewsItem.published
  end
end
