class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = current_user
    @memos = Memo.all
  end
end
