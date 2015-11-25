class OrganizationsController < ApplicationController
  def index
    @organizations = Organization.all
  end

  def show
  end
end
