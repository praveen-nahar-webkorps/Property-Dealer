class CommentsController < ApplicationController
    before_action :set_comment, only: [:edit,:update,:show,:destroy]

    # def index
    #     @comments = Buy.all
    # end

    def create
        @comment = Buy.find(params[:id].)comments.new(comment_params)

        if @comment.save
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
        if @comment.update(buy_params) 
            redirect_to buys_path, notice: "Comment has been updated succesfully"
        else
            render :edit #we can also use in string format like (render 'edit')
        end 
    end

    def show
    end

    def destroy
        if @comment.destroy
			redirect_to buys_path, notice: "Property has been Deleted succesfully"
		end
    end 



    private

    #callbacks
    def set_comment  
        @buy = Buy.find(params[:id])
    end

    #params
    def comment_params
        params.require(:buy).permit(:about,:add,:price,:phone_no,:property_type,:landmark)
    end
end
