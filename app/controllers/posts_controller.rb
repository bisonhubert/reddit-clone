class PostsController < ApplicationController
  before_action :set_post,      only: [:show, :edit, :update, :destroy]
  before_action :set_user,      only: [:create, :show, :edit, :update, :destroy]
  before_action :correct_user,  only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @post = set_post
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = @user.posts.new(post_params)

    if @post.save
      flash[:success] = "Post was successfully created."
      redirect_to user_post_path(@user, @post)
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Post was successfully updated."
      redirect_to user_post_path(@post.user, @post)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "Post was successfully destroyed."
    redirect_to user_posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def correct_user
    @user = User.find(params[:user_id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
