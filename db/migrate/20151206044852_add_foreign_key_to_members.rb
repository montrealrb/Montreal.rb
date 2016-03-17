class AddForeignKeyToMembers < ActiveRecord::Migration
  def change
    add_column :members, :user_id, :integer
    add_foreign_key :members, :users
  end
end
