class CreateNewsItems < ActiveRecord::Migration[5.1]
  def up
    create_table :news_items do |t|
      t.string :state
      t.datetime :published_at
      t.text :body
      t.string :title
      t.timestamps null: false
    end
  end

  def down
    drop_table :news_items
  end
end
