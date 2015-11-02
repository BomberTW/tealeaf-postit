class ChangeColumnNameOnVoteModel < ActiveRecord::Migration
  def change
      rename_column :votes, :voted_id, :voteable_id
      rename_column :votes, :voted_type, :voteable_type
  end
end
