namespace :dev do
  desc "Generate fake data"
  task fakeup: ['db:schema:load', :environment] do
    50.times do |i|
      Category.create(
        name: "Category no#{i}"
      )
      Post.create(
        title: "This is no#{i} post",
        content: "Contents for post no#{i}"
      )
    end

    300.times do
      i=rand(51)
      j=rand(51)
      PostCategory.create(
        post_id: i,
        category_id: j
      )
    end

  end
end
