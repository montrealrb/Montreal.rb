class RemoveTalks < ActiveRecord::Migration
  def change
    drop_table :talks
  end
end
