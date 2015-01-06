, class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    @posts = Post.all
    @post = Post.new
  end

  def create
    # post = Post.new(title: params[:post][:title], url: params[:post][:url])
    puts "testing"
    puts post_params
    post = current_user.posts.new(post_params)
    if post.save
      redirect_to posts_path
    else
      flash[:message] = post.errors.messages
      redirect_to :back # render 'index'
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  private
  def post_params
    params.require(:post).permit(:title, :url)
  end
end
