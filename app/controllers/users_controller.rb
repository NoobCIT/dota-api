class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "You have successfully signed up"
      redirect_to user_path(@user)
    else
      flash.now[:failure] = "Your signup was unsuccessful"
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :username, :password, :password_confirmation, :account_id)
    end

end
