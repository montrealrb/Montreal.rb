class CreateLocations < ActiveRecord::Migration
  def up
    create_table :locations do |t|
      t.string :name
      t.text :address
      t.string :url

      t.timestamps
    end
    Location.create_translation_table! description: :text, directions: :text
  end

  def down
    drop_table :locations
  end
end
