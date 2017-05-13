# frozen_string_literal: true
class JobsController < ApplicationController
  before_action :set_job, only: [:show]

  # GET /jobs
  def index
    base_relation = Job.published.includes(:organization)
    @jobs =
      if params["q"].present?
        filter_jobs(params["q"], base_relation)
      else
        base_relation
      end
  end

  # GET /jobs/1
  def show; end

  private

  def set_job
    @job = Job.published.find(params[:id])
  end

  def filter_jobs(query, base_relation)
    base_relation.where("title LIKE ? OR description LIKE ?", "%#{query}%", "%#{query}%")
  end
end
