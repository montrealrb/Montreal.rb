class AddLogoToCompanies < ActiveRecord::Migration
  def self.up
    add_attachment :companies, :logo
  end

  def self.down
    remove_attachment :companies, :logo
  end
end
