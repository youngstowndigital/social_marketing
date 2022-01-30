class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:session][:email])

    if @user.authenticate(params[:session][:password])
      redirect_to @user
    else
      flash.now[:danger] = 'Incorrect email/password combination'
      render 'new'
    end
  end

  def destroy
  end
end
