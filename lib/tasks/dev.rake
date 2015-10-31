namespace :dev do
  desc "Generate fake data"
  task fakeup: ['db:schema:load', :environment] do
    20.times do |i|
      Post.create(
        title: "This is no#{i} post",
        content: "Contents for post no#{i}"
      )

      Category.create(name: "Category no#{i}")
    end


    

  end
end
