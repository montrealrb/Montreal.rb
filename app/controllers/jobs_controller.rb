# frozen_string_literal: true

class JobsController < ApplicationController
  before_action :set_job, only: [:show]
  before_action :authenticate_user!, only: %i(new create)
  after_action :verify_authorized, only: %i(new create confirmation)

  # No job is find, because the job is not in draft mode anymore
  # or wasn't create by the current user.
  # Redirect the user to the job listing
  rescue_from Pundit::NotAuthorizedError, with: :cant_access_confirmation

  # GET /jobs/new
  def new
    # The organization needs to be built to display the nested form
    @job = Job.new(user_id: current_user.id).tap(&:build_organization)
    authorize @job
  end

  # POST /jobs
  def create
    @job = Job.new(permitted_attributes.merge(user_id: current_user.id))
    authorize @job

    if @job.save
      flash[:notice] = "The job posting has been send for review. Thanks!"
      redirect_to confirmation_job_url(@job)
    else
      render :new
    end
  end

  # GET /jobs/1/confirmation
  def confirmation
    # Pundit need a validate Job object
    # if find_by_id return nil, we set an empty Job
    @job = Job.find_by_id(params[:id]) || Job.new
    authorize @job

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
    attributes = params.require(:job).permit(:title,
                                             :description,
                                             organization_attributes: %i(name address))

    attributes_with_organization(attributes)
  end

  def cant_access_confirmation
    redirect_to(jobs_url) && return
  end

  def attributes_with_organization(attributes)
    # Memorize organization in case this method is called more than once
    @organization ||= Organization.find_by_name(attributes.dig(:organization_attributes, :name))

    if @organization.present?
      # In the case the organization already exist, we don't want to create a new one
      # Remove the attributes and assign the organization id
      attributes.delete(:organization_attributes)
      attributes[:organization_id] = @organization.id
    end

    attributes
  end
end
