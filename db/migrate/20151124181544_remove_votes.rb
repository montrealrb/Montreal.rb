class RemoveVotes < ActiveRecord::Migration
  def change
    drop_table :votes do
      # empty block needed to make the migration reversible
    end
  end
end
