class MakeLocationsNameRequired < ActiveRecord::Migration
  def up
    change_column :locations, :name, :string, null: false
  end

  def down
    change_column :locations, :name, :string, null: true
  end
end
