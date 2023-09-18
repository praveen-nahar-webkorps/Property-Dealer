class CommentsController < ApplicationController
    before_action :set_comment, only: [:edit, :update, :show, :destroy]

    def index
        @comments = Comment.all
    end

    def create
        @buy = Buy.find(params[:comment][:commentable_id])
        @comment = @buy.comments.new(comment_params)
      
        if @comment.save
          redirect_to buy_path(@buy), notice: "Comment has been created successfully"
        else
          render :new
        end
    end

    def new
        @buy = Buy.find(params[:buy_id])
        @comment = @buy.comments.new
    end
      

    private

    def comment_params
        params.require(:comment).permit(:content)
    end
end
