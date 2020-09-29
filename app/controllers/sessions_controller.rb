class SessionsController < ApplicationController

    def new
    end

    def create
        if auth_hash
            login_via_omniauth
        else
            login_via_account
        end
    end

    def login_via_account
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id #check params
            redirect_to user_path(@user)
        else
            @errors = ["Username or password incorrect"]
            render :new
        end
    end

    def auth_hash
        request.env["omniauth.auth"]
    end

    def login_via_omniauth
        binding.pry
        user = User.find_or_create_by(email: auth_hash[:info][:email])
        if user
            session[:user_id] = user.id 
        #   flash[:success] = "Login Successful"  #do I want this? 
            redirect_to invasive_species_path
        else 
            flash[:error] = user.errors.full_messages
            redirect_to login_path
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end
end