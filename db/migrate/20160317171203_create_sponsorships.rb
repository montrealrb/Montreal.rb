class CreateSponsorships < ActiveRecord::Migration[5.1]
  def change
    create_table :sponsorships do |t|
      t.references :event, index: true, foreign_key: true, null: false
      t.references :organization, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
