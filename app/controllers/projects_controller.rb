# frozen_string_literal: true

# Path: app/controllers/projects_controller.rb
class ProjectsController < ApplicationController
  def index
    @projects = Project.where(is_public: true).all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create(project_params)
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
  end

  def edit
    @project
  end

  def destroy
    Project.find(params[:id]).destroy
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :is_public)
  end
end
