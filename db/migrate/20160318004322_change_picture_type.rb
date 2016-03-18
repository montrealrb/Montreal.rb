class ChangePictureType < ActiveRecord::Migration
  def change
    change_column :members, :picture, :string
  end
end
