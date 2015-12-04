class MakeEventsLocationIdRequired < ActiveRecord::Migration
  def up
    change_column :events, :location_id, :integer, null: false
  end

  def down
    change_column :events, :location_id, :integer, null: true
  end
end
