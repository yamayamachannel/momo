class LogsController < ApplicationController

    def index
        @user = current_user
        @memos = Memo.where(user: @user)
        @memo = params[:me]
        @logs = Log.where(memo_id: @memo).order(:money, :minus, :sum, :comment, :created_at)
    end

end