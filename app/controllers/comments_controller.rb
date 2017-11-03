class CommentsController < ApplicationController

  #before_action :set_comment, only: []

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to accept_path(@comment.barter)
    else
    end
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content, :user, :barter)
    end

end
