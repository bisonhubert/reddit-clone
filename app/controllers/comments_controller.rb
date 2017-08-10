class CommentsController < ApplicationController
  before_action :correct_user,  only: [:create]
  before_action :set_post,      only: [:new, :create]

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
      flash[:success] = 'Comment was successfully created.'
      redirect_to user_post_path(@user, @post)
    else
      flash[:alert] = 'Something went wrong.'
    end
  end
 
  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def correct_user
    @user = current_user
    redirect_to(root_url) unless current_user?(@user)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
