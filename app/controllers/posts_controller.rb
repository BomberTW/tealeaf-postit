class PostsController < ApplicationController

  before_filter :find_post, only: [:show]

  def index
    @posts = Post.all
  end

  def show
    
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
