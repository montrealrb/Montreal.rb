class RemoveTalks < ActiveRecord::Migration
  def change
    drop_table :talks do |t|
      t.string :title
      t.text :description
      t.text :bio
      t.string :slides
      t.integer :author_id

      t.timestamps
    end
  end
end
