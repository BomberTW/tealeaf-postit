class Post < ActiveRecord::Base

  include Sluggable

  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments

  sluggable_column(:title)

end
