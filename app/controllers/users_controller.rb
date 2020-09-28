class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)

    if @user.save
      #start session
      #redirect to user path OR redirect to species path (need to decide)
    else
      render :new
    end
  end

  
end
