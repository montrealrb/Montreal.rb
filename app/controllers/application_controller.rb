# frozen_string_literal: true
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :load_sidebar

  def after_sign_in_path_for(_resource)
    slack_check
    return admin_root_path if current_user.admin?
    root_path
  end

  def load_sidebar
    @news_items = NewsItem.published
  end

  private

  def slack_check
    if env["warden"].user.sign_in_count == 1
      email_slack_invite(env["warden"].user.email)
    end
  end
end
