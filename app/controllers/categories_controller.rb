class CategoriesController < ApplicationController

  before_filter :find_category, only: [:show]

  def show
    @posts = @category.posts
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end
end
