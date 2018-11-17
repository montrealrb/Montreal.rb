class AddOrganizerToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :organizer_id, :integer, index: true
  end
end
