# frozen_string_literal: true

class PagesController < ApplicationController
  def show
    @page = Page.friendly.published.find(params[:id])
  end

  def about; end

  def code_of_conduct; end
end
