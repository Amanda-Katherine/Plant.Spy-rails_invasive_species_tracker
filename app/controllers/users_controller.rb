class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    binding.pry
    @user = User.new(user_params)

    if @user.save
      #start session
      #redirect to user path OR redirect to species path (need to decide)
    else
      render :new
      #render error message? 
    end
  end

  def show
    # @user = find_by(id: #current_user)
  end

  def edit
    #@user = user.find_by(id: params[:id])
  end

  def update
    if #authenticate params id is current_user
      @user.update(user_params)
      #redirect to user_path
    else
      #error message
      #redirect (decide where to redirect to)
    end
  end

  def destroy
    @user.destroy
    #redirect to homepage/root path? 
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :about_me, :password, :admin, :location)
  end
end
