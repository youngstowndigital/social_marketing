class ConfirmationsController < ApplicationController
    def create
        @user = User.find_by(email: params[:user][:email])

        if @user.present? && @user.unconfirmed?
            @user.send_confirmation_email!
            flash[:success] = "Check your email for confirmation instructions"
            redirect_to root_path
        else
            flash[:danger] = "We could not find a user with that email or that email has already been confirmed"
            redirect_to new_confirmation_path
        end
    end

    def edit
        @user = User.find_signed(params[:confirmation_token], purpose: :confirm_email)

        if @user.present?
            @user.confirm!
            login @user
            flash[:success] = "Your account has been confirmed"
            redirect_to user_path @user
        else
            flash[:danger] = "Invalid token."
            redirect_to new_confirmation_path
        end
    end

    def new
        @user = User.new
    end
end
