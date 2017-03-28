# frozen_string_literal: true
class TalksController < ApplicationController
  before_action :authenticate_user!

  def new
    if current_user.member.nil?
      flash[:alert] = "You need to create a profile first."
      return redirect_to edit_member_path
    end
    @talk = Talk.new
  end

  def create
    @talk = Talk.new(talk_attributes)
    if @talk.save
      redirect_to @talk
    else
      render :new
    end
  end

  def show
    @talk = Talk.find(params[:id])
  end

  private

  def talk_attributes
    params.require(:talk).
      permit(:title, :level, :format, :slides_url, :description).
      merge(member: current_user.member, state: :proposed)
  end
end
