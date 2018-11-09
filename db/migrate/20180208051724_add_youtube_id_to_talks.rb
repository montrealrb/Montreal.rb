class AddYoutubeIdToTalks < ActiveRecord::Migration[5.1]
  def change
    add_column :talks, :youtube_id, :string
  end
end
