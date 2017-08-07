class UsersController < ApplicationController
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
      remember user
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
end
