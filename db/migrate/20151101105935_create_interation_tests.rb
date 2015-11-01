class CreateInterationTests < ActiveRecord::Migration
  def change
    create_table :interation_tests do |t|
      t.string :user_pages

      t.timestamps null: false
    end
  end
end
