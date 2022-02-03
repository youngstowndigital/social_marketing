class PostsController < ApplicationController
    before_action :logged_in

    def index
        @posts = current_user.posts
    end

    def new
        @post = current_user.posts.build
    end

    def create
        @post = current_user.posts.build(post_params)

        if @post.save
            redirect_to posts_path
        else
            render 'new'
        end
    end

    private

    def post_params
        params.require(:post).permit(:title, :schedule, :text)
    end

    def logged_in
        redirect_to root_path unless logged_in?
    end
end
