class CreateNewsItems < ActiveRecord::Migration
  def up
    create_table :news_items do |t|

      t.timestamps null: false
    end
    NewsItem.create_translation_table! title: :string, state: :string, body: :text
  end

  def down
    drop_table :news_items
    NewsItem.drop_translation_table!
  end
end
