class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
  end

  def create
    user = User.find_by(usname: params[:usname])
    if user and user.authenticate(params[:password])

      session[:user_id] = user.id
      session[:user_usname] = user.usname
      redirect_to user, alert: "User logged in :D"

    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to login_url, alert: "User logged out :D"
  end


end
