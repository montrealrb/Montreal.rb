class RenameCompaniesToOrganizations < ActiveRecord::Migration[5.1]
  def change
   rename_table :companies, :organizations
  end
end
