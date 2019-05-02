class PostsController < ApplicationController
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

  def index
    @post = Post.new
    if params[:keyword]
      @posts = Post.where("content LIKE ?", "%#{params[:keyword]}%").order(created_at: :desc)
      @keyword = params[:keyword]
    else
      @posts = Post.all.order(created_at: :desc)
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def create
    @post = Post.new(
      content: params[:content],
      user_id: @current_user.id
    )
    if @post.save
      flash[:notice] = "投稿を送信しました。"
      redirect_to("/posts/index")
    else
      @posts = Post.all.order(created_at: :desc)
      render "posts/index"
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    @post.save
    flash[:notice] = "投稿を編集しました。"
    redirect_to("/posts/#{params[:id]}")
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました。"
    redirect_to("/posts/index")
  end

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @current_user.id != @post.user_id
      flash[:notice] = "権限がありません。"
      redirect_to("/posts/index")
    end
  end
end
