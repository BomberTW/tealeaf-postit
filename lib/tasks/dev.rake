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
      10.times do |j|
        Comment.create(
          body: "這是第#{(i-1)*50 + j}個評論",
          user_id: i,
          post_id: 50-i
        )
      end
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
