class UserController < ApplicationController
  def index
    if Current.user
      @user = User.find(Current.user.id)
    end
  end
end
