class RegisterController < ApplicationController
  def index

  end

  def create
    if params[:uniqkey] == ENV["UNIQ"]
      if User.exists?(username: user_params[:username])
        redirect_to "/register", notice: "Username taken." and return
      end

      if params[:username].blank?
        redirect_to "/register", notice: "Username not provided." and return
      elsif params[:password].blank?
        redirect_to "/register", notice: "Password not provided." and return
      elsif params[:password_confirmation].blank?
        redirect_to "/register", notice: "Password confirmation not provided." and return
      elsif !(valid_password?)
          redirect_to "/register", notice: "Passwords do not match." and return
      else
        user = User.create!(user_params)
        session[:user_id] = user.id
        redirect_to "/projects"
      end
    else
      redirect_to "/register", notice: "Uniqkey invalid." and return
    end
  end

  private
  def user_params
    params.permit(:username, :password, :password_confirmation)
  end

  def valid_password?
    params[:password] == params[:password_confirmation]
  end
end
