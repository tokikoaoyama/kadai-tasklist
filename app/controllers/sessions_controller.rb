class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    if login(email, password)
      flash[:success] = 'You have successfully logged in!'
      redirect_to root_url
    else
      flash.now[:danger] = 'Failed to log in :( Please try again!'
      render 'sessions/new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'You have successfully logged out!'
    redirect_to root_url
  end
  
  private
  
  def login(email, password)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      return true
    else
      return false
    end
  end
end
