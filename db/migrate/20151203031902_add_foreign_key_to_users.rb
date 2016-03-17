class AddForeignKeyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :member_id, :integer
    add_foreign_key :users, :members
  end
end
