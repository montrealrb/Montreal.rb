class RenameCompaniesToOrganizations < ActiveRecord::Migration
  def change
   rename_table :companies, :organizations
  end
end
