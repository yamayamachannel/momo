class UsersController < ApplicationController
  def index
  end

  def show
    @user = current_user
    @memos = Memo.all
  end
end
