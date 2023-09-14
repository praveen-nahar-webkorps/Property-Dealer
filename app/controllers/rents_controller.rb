class RentsController < ApplicationController
    before_action :set_rent, only: [:edit,:update,:show,:destroy]

    def index
        @rents = Rent.all
    end

    def create
        @rent = Rent.new(rent_params)

        if @rent.save
            redirect_to rents_path, notice: "Property has been created succesfully"
        else
            render :new
        end
    end

    def new
        @rent = Rent.new
    end

    def edit
    end

    def update
        if @rent.update(rent_params) 
            redirect_to rents_path, notice: "Property has been updated succesfully"
        else
            render :edit #we can also use in string format like (render 'edit')
        end 
    end

    def show
    end

    def destroy
        if @rent.destroy
			redirect_to rents_path, notice: "Property has been Deleted succesfully"
		end
    end 

    def all_apartments
        @rents = Rent.where(property_type: "Apartment")
    end

    def all_independents
        @rents = Rent.where(property_type: "Independent")
    end


    private

    #callbacks
    def set_rent   
        @rent = Rent.find(params[:id])
    end

    #params
    def rent_params
        params.require(:rent).permit(:about,:add,:price,:phone_no,:property_type,:landmark)
    end
end
 