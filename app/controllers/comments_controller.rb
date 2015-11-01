class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:id])
    @comment = Comment.create(comment_params)
    if @comment.save(@comment)
      redirect_to @post
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
