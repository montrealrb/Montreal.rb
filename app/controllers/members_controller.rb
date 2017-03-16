class MembersController < ApplicationController
  before_action :authenticate_user!
  def edit
    @member = current_user.member
  end
end
