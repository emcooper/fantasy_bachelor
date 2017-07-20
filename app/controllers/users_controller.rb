class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  before_action :require_self, only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You've successfully created an account!"
      redirect_to @user
    else
      #errors
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to @user
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path if current_admin?
    redirect_to new_user_path 
  end

  private

  def user_params
    params.require(:user).permit(:team_name, :email, :password, :password_confirmation, :role)
  end

  def find_user
    @user = User.find(params[:id])
  end

  def require_self
    render file: "/public/404" unless current_user == @user || current_admin?
  end
end
