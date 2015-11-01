namespace :dev do
  desc "Generate fake data"
  task fakeup: ['db:schema:load', :environment] do
    50.times do |i|
      User.create!(
        name: "Steven no#{i}",
        email: "guy#{i}@gmail.com",
        password: "12345678",
        password_confirmation: "12345678"
      )
      Category.create(
        name: "Category no#{i}"
      )
      Post.create(
        title: "This is no#{i} post",
        content: "Contents for post no#{i}"
      )
      10.times do |j|
        Comment.create(
          body: "這是第#{ i*50 + j}個評論",
          user_id: 1,
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
