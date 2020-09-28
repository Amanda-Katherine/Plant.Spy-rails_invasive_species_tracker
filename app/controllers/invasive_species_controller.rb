class InvasiveSpeciesController < ApplicationController

    def index
        @all_species = InvasiveSpecies.all
    end
    
    # def new
    # end

    def create
    @new_species = InvasiveSpecies.new(species_params)
        if @new_species.save
            #redirect to new species page
        else
            #flash message
            render :new
        end
    end

    def show
        @invasive_species = InvasiveSpecies.find_by(id: #params for id)
    end

    # def edit
    # end

    def update
        @invasive_species = InvasiveSpecies.find_by(id: #determine params)

        if #authenticate current_user is an admin
            @invasive_species.update(species_params)
        else
            #error message about invalid credentials
            #add in functionality to suggest an edit for users? 
            #redirect to invasice species page
        end
    end

    def destroy
        #allow if admin only
        @invasive_species = InvasiveSpecies.find_by(id: #params id)
        @invasive_species.destroy
    end

    private

    def species_params
        params.require(:invasive_species).permit(:common_name, :photo, :description, :environment)
    end
end
