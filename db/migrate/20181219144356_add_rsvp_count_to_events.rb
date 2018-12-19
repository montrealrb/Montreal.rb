class AddRsvpCountToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :rsvp_count, :integer, default: 0, after: :sponsorships_count
  end
end
