class InvasiveSpeciesController < ApplicationController
    before_action :require_login

    def index
        if params[:search]
            @all_species = InvasiveSpecies.name_includes(params[:search])
        else
            @all_species = InvasiveSpecies.all
        end
    end
    
    def new
        @invasive_species = InvasiveSpecies.new
    end

    def create
        binding.pry
        if new_species = InvasiveSpecies.find_by(common_name: species_params[:common_name])
            flash[:failure] = "That species already exists. Please feel free to add a post to it about what you found!"
            redirect_to invasive_specy_path(new_species)
        else new_species = InvasiveSpecies.create(common_name: species_params[:common_name], description: species_params[:description])
            if new_species.save
                redirect_to invasive_specy_path(new_species)
            else
                flash[:failure] = new_species.errors.full_messages
                render :new
            end
        end
    end

    def show
        @invasive_species = InvasiveSpecies.find_by(id: params[:id])
        @posts = @invasive_species.posts
    end

    def edit
        @invasive_species = InvasiveSpecies.find_by(id: params[:id])
        if !current_user.admin
            flash[:failure] = "Only administrators can edit this species. Please make a post for potential edits. Please start your post with *Requested Edit.*"
            redirect_to invasive_specy_path(@invasive_species)
        end
    end

    def update
        @invasive_species = InvasiveSpecies.find_by(id: params[:id])

        if @invasive_species.update(species_params)
            redirect_to invasive_specy_path(@invasive_species)
        else
            flash[:failure] = "Edits not saved. Did you leave the species name blank?"
            render :edit
        end
    end

    def destroy
        redirect_if_not_admin
        @invasive_species = InvasiveSpecies.find_by(id: params[:id])
        @invasive_species.destroy
    end

    private

    def species_params
        params.require(:invasive_species).permit(:common_name, :photo, :description, :environment)
    end
end
