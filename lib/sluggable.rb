module Sluggable
  extend ActiveSupport:Concern

  include do
    before_save :generates_slug!
  end

  def to_param
    slug
  end

  private

  def generate_slug
    the_slug = to_slug(title)
    post = self.class.find_by slug: the_slug
    count = 2

    while post && post != self
      the_slug = append_suffix(the_slug, count)
      post = self.class.find_by slug: the_slug
      count += 1
    end
    self.slug = the_slug.downcase
  end


  def append_suffix(str, count)
    if str.split('-').last.to_i != 0
      return str.split('-').slice(0...-1).join('-') + '-' + count.to_s
    else
      return str + '-' + count.to_s
    end
  end

  def to_slug(name)
    str = name.strip
    str.gsub!(/\s*[^A-Za-z0-9]\s*/, '-')
    str.gsub!(/-+/, '-')
    str.downcase
  end

  module ClassMethod
    def sluggable_column(col_name)
      self.slug_column = col_name
    end
  end

end
