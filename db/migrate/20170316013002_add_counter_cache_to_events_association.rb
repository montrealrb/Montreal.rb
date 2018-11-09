class AddCounterCacheToEventsAssociation < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :talks_count, :integer, :default => 0
    add_column :events, :sponsorships_count, :integer, :default => 0
  end
end
