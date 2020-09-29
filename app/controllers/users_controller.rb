class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    binding.pry

    if user.save
      session[:user_id] = user.id
      redirect_to invasive_species_path
    else
      @errors = user.errors.full_messages
      render :new
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
    params.require(:user).permit(:name, :username, :about_me, :password, :password_confirmation, :admin, :location)
  end
end
