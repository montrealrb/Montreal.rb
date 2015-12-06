class RemoveForeignKeyFromUsersAndAddForeignKeyToMembers < ActiveRecord::Migration
  def change
    remove_foreign_key :users, :members
    remove_column :users, :member_id

    add_column :members, :user_id, :integer
    add_foreign_key :members, :users
  end
end
