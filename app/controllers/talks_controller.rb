class TalksController < ApplicationController
  def new
    @talk = Talk.new
  end
end
