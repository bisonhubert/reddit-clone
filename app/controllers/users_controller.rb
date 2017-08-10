class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      remember @user
      flash[:success] = "Welcome, #{@user.username}!"
      redirect_to @user
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user
      flash[:success] = "#{@user.username} was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
    flash[:success] = "#{@user.username} was successfully destroyed."
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:alert] = "Please log in."
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find(params[:id]) || User.find(params[:user_id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
