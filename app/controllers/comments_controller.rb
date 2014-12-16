class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @comments = Comment.all
    @comment = Comment.new
  end

  def create
    comment = current_user.comments.new(comment_params)
    user = {}
    user[:email] = comment.user.email
    if comment.save
      render json: {:comment => comment, :user => user}, status: 201
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  private
    def comment_params
      params.require(:comment).permit(:title, :post_id)
    end
end
