class ConfirmationsController < ApplicationController
    def create
        @user = User.find_by(email: params[:user][:email])

        if @user.present? && @user.unconfirmed?
            flash[:success] = "Check your email for confirmation instructions"
            redirect_to root_path
        else
            flash[:alert] = "We could not find a user with that email or that email has already been confirmed"
            redirect_to new_confirmation_path
        end
    end

    def edit
        @user = User.find_signed(params[:confirmation_token], purpose: :confirm_email)

        if @user.present?
            @user.confirm!
            flash[:notice] = "Your account has been confirmed"
        else
            flash[:alert] = "Invalid token."
            redirect_to new_confirmation_path
        end
    end

    def new
        @user = User.new
    end
end
