# frozen_string_literal: true
class OrganizationsController < ApplicationController
  def index
    @organizations = Organization.all.includes(:translations)
  end

  def show
    @organization = Organization.find(params[:id])
  end
end
