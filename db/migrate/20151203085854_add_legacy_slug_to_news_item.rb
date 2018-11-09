class AddLegacySlugToNewsItem < ActiveRecord::Migration[5.1]
  def change
    add_column :news_items, :slug, :string
    add_index :news_items, :slug
  end
end
