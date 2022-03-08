class UsersController < ApplicationController
    before_action :logged_in, only: [:show]

    def  show
        @user = User.find(params[:id])
        redirect_to root_path unless @user == current_user
        @posts = @user.posts
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            redirect_to @user
        else
            render 'new'
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
