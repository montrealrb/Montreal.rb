class AddMessageToSponsorship < ActiveRecord::Migration[5.1]
  def change
    add_column :sponsorships, :message, :string
  end
end
