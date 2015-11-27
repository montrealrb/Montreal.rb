class RemoveTalks < ActiveRecord::Migration
  def change
    drop_table :talks do
      # empty block needed to make the migration reversible
    end
  end
end
