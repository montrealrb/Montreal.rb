class CreateLocations < ActiveRecord::Migration[5.1]
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
    Location.drop_translation_table!
  end
end
