class AddForeignKeyToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :member_id, :integer
    add_foreign_key :users, :members
  end
end
