class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def generate_slug
    self.slug = self.title.gsub(" ", "-").downcase
  end

  def to_param
    self.slug
  end
end
