class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :vote
      t.string :voted_type
      t.integer :voted_id

      t.timestamps null: false
    end
  end
end
