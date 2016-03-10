class AddUserIdToSomeModels < ActiveRecord::Migration
  def up

    User.create_default_user! if User.default_user.blank?

    add_column :news_items, :user_id, :integer
    NewsItem.update_all user_id: User.default_user.id
    change_column_null :news_items, :user_id, false

    add_column :jobs, :user_id, :integer
    Job.update_all user_id: User.default_user.id
    change_column_null :jobs, :user_id, false

    add_column :events, :user_id, :integer
    Event.update_all user_id: User.default_user.id
    change_column_null :events, :user_id, false

    add_index :events, :user_id
    add_index :jobs, :user_id
    add_index :news_items, :user_id
  end

  def down
    remove_index :events, :user_id
    remove_index :jobs, :user_id
    remove_index :news_items, :user_id

    remove_column :events, :user_id
    remove_column :jobs, :user_id
    remove_column :news_items, :user_id
  end
end
