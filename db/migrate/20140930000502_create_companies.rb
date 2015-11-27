class CreateCompanies < ActiveRecord::Migration
  class Company < ActiveRecord::Base
    translates :description
  end

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
    Company.drop_translation_table!
  end
end
