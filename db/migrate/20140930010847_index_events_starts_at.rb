class IndexEventsStartsAt < ActiveRecord::Migration[5.1]
  def change
    add_index :events, :starts_at
  end
end
