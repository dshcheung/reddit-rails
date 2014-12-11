class CommentsController < ApplicationController
  def index
    @comments = Comment.all
    @comment = Comment.new
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      redirect_to comments_path
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  private
    def comment_params
      params.require(:comment).permit(:title, :postID)
    end
end
