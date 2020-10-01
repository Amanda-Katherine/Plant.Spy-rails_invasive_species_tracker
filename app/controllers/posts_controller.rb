class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    # def new
    # end

    def create
        @post = Post.new(post_params)

        if @post.save
            # redirect to post page
        else
            #error 
            render :new
        end
    end

    # def show
    #     @post = Post.find_by(id: #params id)
    # end

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
        @post = Post.find_by(id: #id params)
        #if authenticate current user is post creator
            @post.destroy
        #end 
    end

    private 

    def post_params
        params.require(:post).permit(:species_name, :description, :location_latitude, :location_longitude, :photo, :invasive_species_id, :user_id)
    end
end
