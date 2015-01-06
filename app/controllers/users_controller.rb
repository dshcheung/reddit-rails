class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      flash[:message] = "success"
      redirect_to edit_user_path
    else
      flash[:message] = "fail"
      redirect_to edit_user_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:avatar)
  end
end
