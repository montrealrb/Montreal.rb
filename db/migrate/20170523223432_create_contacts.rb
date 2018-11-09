class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.text :note
      t.references :organization, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
