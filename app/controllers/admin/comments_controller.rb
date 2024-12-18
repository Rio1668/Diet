class Admin::CommentsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  
  def index
    @comments = Comment.all
  end
  
  def destroy
    @comment = Comment.find_by_id(params[:id])
    @user = @comment.user
    @comment&.destroy
    flash[:notice] = "削除しました"
    redirect_to admin_user_path(@user)
  end 
end
