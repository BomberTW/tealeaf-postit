class CategoriesController < ApplicationController

  before_filter :find_category, only: [:show]

  def show
    @posts = @category.posts.includes(:categories)
  end

  private

  def find_category
    @category = Category.where("slug=?", params[:id]).first
  end

end
