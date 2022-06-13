class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: user_params[:username])

    if user.present? && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect_to "/projects", notice: "login successful" and return
    else
      flash[:alert] = "invalid username/password."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/projects", notice: "logged out."
  end

  private
  def user_params
    params.permit(:username, :password)
  end
end
