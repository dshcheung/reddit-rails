class PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new
  end

  def create
    # post = Post.new(title: params[:post][:title], url: params[:post][:url])
    post = Post.new(post_params)
    if post.save
      redirect_to posts_path
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private
    def post_params
      params.require(:post).permit(:title, :url)
    end
end
