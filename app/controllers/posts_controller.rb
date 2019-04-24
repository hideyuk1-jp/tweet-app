class PostsController < ApplicationController
  def index
    if params[:keyword]
      @posts = Post.where("content LIKE ?", "%#{params[:keyword]}%")
      @keyword = params[:keyword]
    else
      @posts = Post.all
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end
end
