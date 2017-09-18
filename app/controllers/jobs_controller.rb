# frozen_string_literal: true

class JobsController < ApplicationController
  before_action :set_job, only: [:show]
  before_action :authenticate_user!, only: %i(new create)

  # GET /jobs/new
  def new
    # The organization needs to be built to display the nested form
    @job = Job.new.tap(&:build_organization)
  end

  # POST /jobs
  def create
    @job = Job.new(permitted_attributes.merge(user_id: current_user.id))

    if @job.save
      flash[:notice] = "The job posting has been send for review. Thanks!"
      redirect_to confirmation_job_url(@job)
    else
      render :new
    end
  end

  # GET /jobs/1/confirmation
  def confirmation
    @job = Job.draft.where(user_id: current_user&.id).find_by_id(params[:id])

    # No job is find, because the job is not in draft mode anymore
    # or wasn't create by the current user.
    # Redirect the user to the job listing
    redirect_to(jobs_url) && return if @job.nil?

    render :show
  end

  # GET /jobs
  def index
    @jobs = Job.published.includes(:organization)
  end

  # GET /jobs/1
  def show; end

  private

  def set_job
    @job = Job.published.find(params[:id])
  end

  def permitted_attributes
    params.require(:job).permit(:title,
                                :description,
                                organization_attributes: %i(name address))
  end
end
