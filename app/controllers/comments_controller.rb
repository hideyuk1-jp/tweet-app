class CommentsController < ApplicationController
  before_action :authenticate_user, {only: [:create, :destroy]}
  before_action :ensure_correct_user, {only: [:destroy]}

  def create
    @comment = Comment.new(
      content: params[:content],
      user_id: @current_user.id,
      post_id: params[:post_id]
    )
    if @comment.save
      flash[:notice] = "コメントを送信しました。"
      redirect_to("/posts/#{params[:post_id]}")
    else
      @comments = Comment.all.order(created_at: :desc).page(params[:page]).per(COMMENT_PER)
      @post = @comment.post
      render "posts/show"
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @post = @comment.post
    @comment.destroy
    flash[:notice] = "コメントを削除しました。"
    redirect_to("/posts/#{@post.id}")
  end

  def ensure_correct_user
    @comment = Comment.find_by(id: params[:id])
    if @current_user.id != @comment.user_id
      flash[:notice] = "権限がありません。"
      redirect_to("/posts/#{params[:post_id]}")
    end
  end
end
