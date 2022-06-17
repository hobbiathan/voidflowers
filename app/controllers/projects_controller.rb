class ProjectsController < ApplicationController
  def index
    if Current.user
      @user = User.find(session[:user_id])
    end

    @projects = Project.all

  end

  def new

  end

  def create
    if params[:title].blank?
      redirect_to "/projects/new", notice: "Title not provided." and return
    elsif params[:description].blank?
      redirect_to "/projects/new", notice: "Description confirmation not provided." and return
    else
      project = Project.create!(project_params)
      redirect_to "/projects"
    end
  end

  private
  def project_params
    params.permit(:title, :date_year, :description, :project_url, :image)
  end
end
