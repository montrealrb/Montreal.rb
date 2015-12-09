class AddUserIdToSomeModels < ActiveRecord::Migration
  def change
    add_column :events, :user_id, :integer, null: false
    add_column :jobs, :user_id, :integer, null: false
    add_column :news_items, :user_id, :integer, null: false

    add_index :events, :user_id
    add_index :jobs, :user_id
    add_index :news_items, :user_id
  end
end
