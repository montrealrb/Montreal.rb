class LocationBelongsToEvent < ActiveRecord::Migration[5.1]
  def change
    add_reference :events, :location, index: true
  end
end
