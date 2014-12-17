class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @comments = Comment.all
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    user = {}
    user[:email] = @comment.user.email
    if @comment.save
      respond_to do |format|
        format.js {render 'create.js.erb'}
      end
    else
      flash[:message] = @comment.errors.messages
      respond_to do |format|
        format.js {render 'fail.js.erb'}
      end
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
