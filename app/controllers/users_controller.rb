class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @nickname = current_user.nickname
    @items = current_user.items
  end

  private

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

  def move_to_mypage
    @user = User.find(params[:id])
    redirect_to user_path(current_user) if current_user.id != @user.id
    redirect_to user_path(current_user) if @user = nil
  end
end
