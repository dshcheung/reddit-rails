class PostVotesController < ApplicationController
  def create
    post = Post.find(params[:id])
    new_vote = PostVote.new(:user => current_user, :post => post)
    if new_vote.save
      render json: new_vote, status: 201
    end
  end
end
