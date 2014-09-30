class IndexEventsStartsAt < ActiveRecord::Migration
  def change
    add_index :events, :starts_at
  end
end
