class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :state
      t.string :title
      t.text :description
      t.integer :organization_id

      t.timestamps null: false
    end
  end
end
