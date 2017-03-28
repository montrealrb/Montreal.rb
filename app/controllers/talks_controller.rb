class TalksController < ApplicationController
  before_action :authenticate_user!

  def new
    @talk = Talk.new
  end

  def create
    @talk = Talk.create(talk_attributes)
    if @talk.valid?
      redirect_to new_talks_path
    else
      render :new
    end
  end

  private

  def talk_attributes
    params.require(:talk)
      .permit(:title, :level, :format, :slides_url, :description)
      .merge(member: current_user.member, state: :proposed)
  end
end
