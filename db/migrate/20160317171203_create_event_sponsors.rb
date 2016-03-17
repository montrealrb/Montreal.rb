class CreateEventSponsors < ActiveRecord::Migration
  def change
    create_table :event_sponsors, id: false do |t|
      t.references :event, index: true, foreign_key: true, null: false
      t.references :organization, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
