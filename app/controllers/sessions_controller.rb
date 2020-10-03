class SessionsController < ApplicationController
    before_action :redirect_if_logged_in, except: [:destroy]

    def new
    end

    def create
        if auth
            login_via_omniauth
        else
            login_via_account
        end
    end

    def login_via_account
        @user = User.create_or_find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id #check params
            redirect_to user_path(@user)
        else
            @errors = ["Username or password incorrect"]
            render :new
        end
    end
    
    def auth
        request.env["omniauth.auth"]
    end
    
    def login_via_omniauth
        user = User.find_or_create_by(username: auth[:info][:email]) do |u|
            if auth[:provider] == "github"
                u.username = auth[:info][:nickname]
            end
            u.name = "Unknown - Onmiauth Login"
            u.password = SecureRandom.hex
        end

        if user.save
            session[:user_id] = user.id 
            redirect_to invasive_species_path
        else 
            flash[:error] = user.errors.full_messages
            redirect_to login_path
        end
    end

    def destroy
        session.destroy
        redirect_to root_path
    end
end