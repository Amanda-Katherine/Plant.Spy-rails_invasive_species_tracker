class PostsController < ApplicationController
    before_action :require_login

    def index
        if params[:invasive_specy_id]
            inv_species = InvasiveSpecies.find_by(id: params[:invasive_specy_id])
            @posts = inv_species.posts
            if @posts != []
                @posts
            else
                #insert error about no posts created yet
                redirect_to invasive_specy_path(inv_species)
            end
        else 
            @posts = Post.all
        end
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
        if @post.invasive_species[:description] == nil
            @post.invasive_species[:description] = @post.description
            @post.invasive_species.save
        end
        
        if @post.save
          if params[:post][:invasive_species_attributes][:id].present?
            redirect_to invasive_specy_path(@post.invasive_species)
          else
            redirect_to post_path(@post)
          end
        else
            flash[:failure] = @post.errors.full_messages
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
