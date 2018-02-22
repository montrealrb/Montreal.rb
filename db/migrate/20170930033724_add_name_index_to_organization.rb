class AddNameIndexToOrganization < ActiveRecord::Migration[5.1]
  def change
    add_index :organizations, :name 
  end
end
