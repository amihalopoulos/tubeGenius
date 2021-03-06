class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    if user && user.authenticate(params[:user][:password])
      session_in!(user)
      redirect_to videos_path
    else
      set_flash("Bad login information")
      redirect_to signup_path
    end
  end

  def destroy
    session_out!
    redirect_to root_path
  end
end