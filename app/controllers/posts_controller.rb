class PostsController < ApplicationController
    before_action :logged_in

    def index
        @posts = current_user.posts
    end

    def new
        @post = current_user.posts.build
    end

    def show
        @post = current_user.posts.find(params[:id])
    end

    def create
        @post = current_user.posts.build(post_params)

        if @post.save
            flash[:success] = "Post scheduled"
            @post.set_utc_date
            @post.schedule_post
            redirect_to posts_path
        else
            render 'new'
        end
    end

    def edit
        @post = current_user.posts.find(params[:id])
    end

    def update
        @post = current_user.posts.find(params[:id])

        if @post.update(post_params)
            flash[:success] = "Post rescheduled"
            @post.set_utc_date
            @post.schedule_post
            redirect_to posts_path
        else
            render 'new'
        end
    end

    def destroy
        @post = current_user.posts.find(params[:id])
        @post.destroy
        redirect_to posts_path, status: :see_other
    end

    private

    def post_params
        params.require(:post).permit(:title, :schedule, :text, :timezone, :twitter_account_id)
    end
end
