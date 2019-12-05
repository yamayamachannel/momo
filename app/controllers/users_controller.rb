class UsersController < ApplicationController
  def index
    @users = User.search(params[:search])
  end

  def show
    @user = current_user
    @memos = Memo.all
  end
end
