# frozen_string_literal: true

class MembersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_member
  def edit; end

  def update
    return redirect_to edit_member_path if @member.update_attributes(permitted_attributes)
    render :edit
  end

  alias :create :update

  private

  def find_member
    @member = current_user.member || current_user.build_member
  end

  def permitted_attributes
    params.require(:member).permit(:name, :email, :twitter_handle, :picture,
                                   :github_handle, :biography, :company,
                                   :website)
  end
end
