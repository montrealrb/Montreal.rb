class RemoveBioFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :bio, :string
  end
end
