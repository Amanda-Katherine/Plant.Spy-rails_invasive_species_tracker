class PostsController < ApplicationController
    before_action :require_login

    def index
        @posts = Post.all
    end

    def new
        if params[:invasive_specy_id]
            @invasive_species = InvasiveSpecies.find_by(id: params[:invasive_specy_id])
            @post = @invasive_species.posts.build
        else 
            @post = Post.new
            @post.build_invasive_species
        end
    end

    def create
        @post = Post.new(post_params)
        
        @post.user = current_user
        
        if !@post.invasive_species
             @post.invasive_species = InvasiveSpecies.find_by(common_name: params[:post][:common_name])
        end
        
        if !@post.invasive_species.description
            @post.invasive_species.description = @post.description
            @post.invasive_species.save
        end
        if @post.save
            redirect_to invasive_specy_path(@post.invasive_species)
        else
            flash[:failure] = @post.errors.full_messages
            render :new
        end
    end

    def show
        @post = Post.find_by(id: params[:id])
    end

    def edit
        @post = Post.find_by(id: params[:id])
        binding.pry
    end

    def update
        @post = Post.find_by(id: params[:id])
        
        if !@post.invasive_species.description
            @post.invasive_species.description = @post.description
            @post.invasive_species.save
        end

        if @post.update(post_params)
            redirect_to invasive_specy_path(@post.invasive_species)
        else
            flash[:failure] = @post.errors.full_messages
            render :edit
        end
    end

    def destroy
        @post = Post.find_by(id: params[:id])
        if @post.user == current_user 
            @post.destroy
        else
            flash[:failure] = "Sorry, you do not have permission to edit this post"
        end
        redirect_to invasive_species_path
    end

    private 

    def post_params
        params.require(:post).permit(:description, :location_latitude, :location_longitude, :photo, :user_id, invasive_species_attributes: [:common_name, :photo, :description])
    end
end
