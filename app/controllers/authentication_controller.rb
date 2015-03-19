class AuthenticationController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to rants_path
    else
      @sign_in_error = "Username / password combination is invalid"
      redirect_to rants_path
    end
  end

end
