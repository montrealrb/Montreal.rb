class JobsController < ApplicationController
  before_action :set_job, only: [:show]

  # GET /jobs
  def index
    @jobs = Job.published
  end

  # GET /jobs/1
  def show
  end

  private

  def set_job
    @job = Job.published.find(params[:id])
  end
end
