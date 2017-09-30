# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :load_sidebar

  def after_sign_in_path_for(_resource)
    return admin_root_path if current_user.admin?
    root_path
  end

  def load_sidebar
    @news_items = NewsItem.published
  end
end
