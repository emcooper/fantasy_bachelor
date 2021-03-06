class SessionsController < ApplicationController

  def new
  end

  def root
    redirect_to login_path
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "Welcome #{@user.team_name}!"
      redirect_to @user
    else
      #errors
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
