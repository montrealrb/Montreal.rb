class AddSlugToPage < ActiveRecord::Migration[5.1]
  def change
    add_column :pages, :slug, :string, null: false, default: 'temporary-slug'

    # make sure we define a slug for existing pages
    Page.find_each do |page|
      page.update(slug: '')
    end

    add_index :pages, :slug, unique: true
  end
end
