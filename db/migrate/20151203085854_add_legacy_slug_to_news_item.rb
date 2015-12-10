class AddLegacySlugToNewsItem < ActiveRecord::Migration
  def change
    add_column :news_items, :slug, :string
    add_index :news_items, :slug
  end
end
