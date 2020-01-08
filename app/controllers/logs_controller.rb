class LogsController < ApplicationController

    def index
        @user = current_user
        @memos = Memo.where(user: @user)
        @memo = params[:me]
        @logs = Log.where(memo_id: @memo)
        @logs_5 = @logs.first(5)
        @logs_others = @logs-@logs_5
    end

end