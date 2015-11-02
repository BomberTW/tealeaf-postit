class PostsController < ApplicationController

  before_filter :find_post, only: [:show, :vote]

  def index
    @posts = Post.all.includes(:categories).order(id: :desc)
  end

  def show
    @comments = Post.includes(comments: [:user]).where("slug = ?", params[:id]).first
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def vote
    Vote.create(vote: params[:vote], voteable: @post, user_id: current_user.id)
    flash[:notice] = "Your vote was counted."
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def find_post
    @post = Post.where("slug = ?", params[:id]).first
  end
end
