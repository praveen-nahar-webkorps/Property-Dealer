class BuysController < ApplicationController
    before_action :set_buy, only: [:edit,:update,:show,:destroy]

    def index
        @buys = Buy.all
    end

    def create
        @buy = Buy.new(buy_params)
        
        if @buy.save
            redirect_to buys_path, notice: "Property has been created succesfully"
        else
            render :new
        end
    end

    def new
        @buy = Buy.new
    end

    def edit
    end

    def update
        if @buy.update(buy_params) 
            redirect_to buys_path, notice: "Property has been updated succesfully"
        else
            render :edit #we can also use in string format like (render 'edit')
        end 
    end

    def show
       
    end

    def destroy
        if @buy.destroy
			redirect_to buys_path, notice: "Property has been Deleted succesfully"
		end
    end 

    def all_apartments
        @buys = Buy.where(property_type: "Apartment")
    end

    def all_independents
        @buys = Buy.where(property_type: "Independent")
    end


    private

    #callbacks
    def set_buy   
        @buy = Buy.find(params[:id])
    end

    #params
    def buy_params
        params.require(:buy).permit(:about,:add,:price,:phone_no,:property_type,:landmark)
    end
end
