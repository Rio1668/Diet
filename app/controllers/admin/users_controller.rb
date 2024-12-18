class Admin::UsersController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @comments = @user.comments
  end 
  
  def destroy
    @user = User.find_by_id(params[:id])
    @user&.destroy
    flash[:notice] = "削除しました"
    redirect_to admin_users_path
  end 
end
