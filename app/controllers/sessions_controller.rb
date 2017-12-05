class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      remember user
      flash[:success] = "You successfully logged in"
      redirect_to user
    else
      flash.now[:failure] = "You failed to log in"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
