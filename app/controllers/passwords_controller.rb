class PasswordsController < ApplicationController
    before_action :redirect_if_authenticated

    def create
        @user = User.find_by(email: params[:user][:email].downcase)

        if @user.present?
            if @user.confirmed?
                @user.send_password_reset_email
                flash[:success] = "Password reset instructions have been sent if that user exists."
                redirect_to root_path
            else
                flash[:danger] = "Please confirm your email."
                redirect_to new_confirmation_path
            end
        else
            flash[:success] = "Password reset instructions have been sent if that user exists."
            redirect_to root_path
        end
    end

    def new
    end

    def update
        @user = User.find_signed(params[:password_reset_token], purpose: :reset_password)
        if @user
            if @user.unconfirmed?
                flash[:danger] = "Please confirm your email."
                redirect_to new_confirmation_path
            elsif @user.update(password_params)
                flash[:success] = "Sign in."
                redirect_to login_path
            else
                flash.now[:danger] = @user.errors.full_messages.to_sentence
                render :edit, status: :unprocessable_entity
            end
        else
            flash.now[:danger] = "Invalid or expired token."
            render :new, status: :unprocessable_entity
        end
    end

    private

    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end
end
