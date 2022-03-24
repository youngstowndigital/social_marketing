class SessionsController < ApplicationController
  before_action :redirect_if_authenticated, only: [:create, :new]

  def new
  end

  def create
    @user = User.find_by_email(params[:session][:email])

    if @user && @user.confirmed? && @user.authenticate(params[:session][:password])
      login @user
      redirect_to @user
    else
      flash.now[:danger] = 'Incorrect email/password combination'
      render 'new'
    end
  end

  def destroy
    logout
    flash[:success] = "Signed out"
    redirect_to root_path, status: :see_other
  end
end
