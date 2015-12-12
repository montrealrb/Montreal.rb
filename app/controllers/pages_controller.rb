class PagesController < ApplicationController
  def show
    @page = Page.published.find(params[:id])
  end

  def about; end
end
