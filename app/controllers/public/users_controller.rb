class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  
  def mypage
    @posts = current_user.posts
  end
end
