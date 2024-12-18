class Public::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy]
  
  def create
    @group = Group.find(params[:group_id])
    @comment = current_user.comments.build(comment_params.merge(group: @group))
    if @comment.save
      flash[:notice] = "登録しました"
      redirect_to @group
    else
      flash.now[:alert] = "登録に失敗しました"
      @users = @group.users
      @comments = @group.comments
      render 'public/groups/show'
    end
  end
  
  def destroy
    @comment.destroy
    flash[:notice] = "削除しました"
    redirect_to @comment.group
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:body)
  end
  
  def correct_user
    @comment = current_user.comments.find_by_id(params[:id])
    redirect_to root_path unless @comment
  end
end
