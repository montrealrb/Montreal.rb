class CreateCompanies < ActiveRecord::Migration
  def up
    create_table :companies do |t|
      t.string :name, null: false
      t.string :address
      t.string :logo

      t.timestamps
    end
    Company.create_translation_table! :description => :text
  end

  def down
    drop_table :companies
    Company.drop_tranlation_table!
  end
end
