class AddUniqueIndexToVotes < ActiveRecord::Migration[5.0]
  def change
    add_index :votes, [:voter_id, :voter_type, :votable_id, :votable_type, :vote_scope], unique: true
  end
end
