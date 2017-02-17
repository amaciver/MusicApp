class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to bands_url
    else
      render :new
    end
  end

  def show
    if current_user
      render :show
    else
      redirect_to new_session_url
    end
  end


  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
