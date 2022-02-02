class PostsController < ApplicationController
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
        params.require(:post).permit(:schedule, :text)
    end
end
