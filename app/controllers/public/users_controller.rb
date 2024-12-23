class Public::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def mypage
    @posts = current_user.posts
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @groups = @user.joined_groups
  end

  def index
    @users = User.all
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "編集稿しました"
      redirect_to user_path(@user)
    else
      flash.now[:alert] = "編集に失敗しました"
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = "退会しました"
    redirect_to root_path
  end
  
  def guest_log_in
    user = User.guest_log_in
    sign_in(user)
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:body)
  end

  def correct_user
    @user = User.find_by_id(params[:id])
    redirect_to root_url if @user && @user != current_user
  end
end
