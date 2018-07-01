class CreatePages < ActiveRecord::Migration[5.1]
  def up
    create_table :pages do |t|
      t.string :state, null: false

      t.timestamps null: false
    end

    Page.create_translation_table! body: :text, title: { type: :string }
    change_column :page_translations, :body, :string, null: false
  end

  def down
    drop_table :pages
    Page.drop_translation_table!
  end
end
