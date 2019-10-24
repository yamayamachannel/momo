class MonesController < ApplicationController
    def index
        @posts = Post.all.order(created_at: 'desc')
    end
    # def test
    # end
end
