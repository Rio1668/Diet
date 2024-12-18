class Public::GroupsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def index
    @groups = Group.all
  end
  
  def show
    @group = Group.find(params[:id])
    @users = @group.users
    @comment = Comment.new
    @comments = @group.comments
  end

  def new
    @group = Group.new
  end
  
  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      flash[:notice] = "登録しました"
      redirect_to group_path(@group)
    else
      flash.now[:alert] = "登録に失敗しました"
      render :new
    end
  end

  def edit
  end
  
  def update
    if @group.update(group_params)
      flash[:notice] = "登録しました"
      redirect_to group_path(@group)
    else
      flash.now[:alert] = "登録に失敗しました"
      render :edit
    end
  end

  def destroy
    @group.destroy
    flash[:notice] = "削除しました"
    redirect_to mypage_path
  end
  
  private
  
  def group_params
    params.require(:group).permit(:name, :body)
  end
  
  def correct_user
    @group = current_user.groups.find_by_id(params[:id])
    redirect_to root_path unless @group
  end
end
