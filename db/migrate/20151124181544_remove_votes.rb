class RemoveVotes < ActiveRecord::Migration[5.1]
  def change
    drop_table :votes do |t|
      t.references :votable, polymorphic: true, index: true
      t.belongs_to :user

      t.timestamps
    end
  end
end
