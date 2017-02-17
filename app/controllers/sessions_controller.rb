class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_credentials(params[:session][:email], params[:session][:password])
    if @user
      login(@user)
      redirect_to bands_url
    else
      flash[:errors] = ['Invalid Credentials']
      redirect_to new_session_url
    end
  end

  def destroy
    logout #if logged_in?
    redirect_to new_session_url
  end

  private

end
