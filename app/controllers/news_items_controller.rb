# frozen_string_literal: true
class NewsItemsController < ApplicationController
  def index
    @on_news_index = true
    @news_items = news_item_scope.to_a
  end

  # TODO: See Issue #151
  # If `params[:slug]` is present, it's *most probably* coming from a
  # wordpress legacy link.
  # When the legacy data was imported, we also stored that original `slug`
  # and this is why we first try to load an event_item using that param.
  #
  def show
    @news_item = find_news_item_by_leagcy ||
                 find_news_item_by_id ||
                 raise(ActiveRecord::RecordNotFound)
  end

  private

  def find_news_item_by_leagcy
    news_item_scope.where(slug: params[:slug]).first if params[:slug]
  end

  def find_news_item_by_id
    news_item_scope.where(id: params[:id]).first
  end

  def news_item_scope
    NewsItem.published
  end
end
