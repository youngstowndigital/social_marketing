class UsersController < ApplicationController
    before_action :redirect_if_authenticated, only: [:new, :create]
    before_action :redirect_if_unauthenticated, only: [:show]

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
            @user.send_confirmation_email!
            flash[:success] = "Please check your email for confirmation instructions."
            redirect_to root_path
        else
            render 'new'
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
