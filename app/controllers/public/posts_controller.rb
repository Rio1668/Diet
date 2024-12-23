class Public::PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def index
  end

  def new
    @date = params[:date].present? ? Date.parse(params[:date]) : Date.today
    @post = current_user.posts.build
    @genres = Genre.all
    @post.menus.build
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "投稿しました"
      redirect_to post_path(@post)
    else
      @date = params[:date].present? ? Date.parse(params[:date]) : Date.today
      @genres = Genre.all
      flash.now[:alert] = "投稿に失敗しました"
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    start = @post.start_time.ago(2.weeks)
    finish = @post.start_time.since(2.weeks)
    @posts = @post.user.posts.where(start_time: start..finish).order(start_time: :asc)
  end
  
  def edit
    @genres = Genre.all
  end
  
  def update
    if @post.update(post_params)
      flash[:notice] = "投稿しました"
      redirect_to post_path(@post)
    else
      @genres = Genre.all
      flash.now[:alert] = "投稿に失敗しました"
      render :edit
    end
  end
  
  def destroy
    @post.destroy
    flash[:success] = "投稿を削除しました"
    redirect_to posts_path
  end 
  
  private
  
  def post_params
    params.require(:post).permit(:weight, :start_time, menus_attributes: [:id, :name, :number_of_times, :genre_id, :_destroy])
  end
  
  def correct_user
    @post = current_user.posts.find_by_id(params[:id])
    redirect_to root_url unless @post
  end
end
