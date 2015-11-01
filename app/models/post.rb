class Post < ActiveRecord::Base

  before_save :generate_slug

  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments

  def generate_slug
    self.slug = self.title.gsub(" ", "-").downcase
  end

  def to_param
    self.slug
  end
end
