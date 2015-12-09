class CreateTalks < ActiveRecord::Migration
  def up
    create_table :talks do |t|
      t.integer :state, default: 0
      t.integer :level, default: 0
      t.string :slides_url
      t.references :event, index: true, foreign_key: true

      t.timestamps null: false
    end
    Talk.create_translation_table! title: :string, description: :text
  end

  def down
    drop_table :talks
    Talk.drop_translation_table!
  end
end
