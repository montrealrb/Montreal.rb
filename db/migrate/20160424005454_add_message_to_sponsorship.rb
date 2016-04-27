class AddMessageToSponsorship < ActiveRecord::Migration
  def change
    add_column :sponsorships, :message, :string
  end
end
