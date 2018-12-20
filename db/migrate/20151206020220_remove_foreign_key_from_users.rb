class RemoveForeignKeyFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :users, :members
    remove_column :users, :member_id
  end
end
