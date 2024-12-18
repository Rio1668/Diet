class Public::GroupUsersController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    current_user.join_group(@group)
    flash[:notice] = "参加しました"
    redirect_back(fallback_location: root_url)
  end
  
  def destroy
    @group = Group.find(params[:group_id])
    current_user.detach_group(@group)
    flash[:notice] = "参加をとりやめました"
    redirect_back(fallback_location: root_url)
  end
end
