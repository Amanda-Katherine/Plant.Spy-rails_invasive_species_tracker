class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def new
        binding.pry
        if params[:invasive_species_id]
            @invasive_species = InvasiveSpecies.find_by(id: params[:invasive_species_id])
            @post = @invasive_species.posts.build
        else 
            @post = Post.new
            @post.build_invasive_species
        end
    end

    def create
        @post = Post.new(post_params)

        if @post.save
            # redirect to post page
            redirect_to post_path(@post)
        else
            #error 
            render :new
        end
    end

    def show
        @post = Post.find_by(id: params[:id])
    end

    # def edit
    #     @post = Post.find_by(id: #params)
    # end

    def update
        @post = Post.find_by(id: params[:id])

        if @post.update
            #redirect to post path
        else
            #errors
            render :edit
        end
    end

    def destroy
        @post = Post.find_by(id: params[:id])
        #if authenticate current user is post creator
            @post.destroy
        #end 
    end

    private 

    def post_params
        params.require(:post).permit(:description, :location_latitude, :location_longitude, :photo, :user_id, invasive_species_attributes: [:common_name, :photo, :description])
    end
end
