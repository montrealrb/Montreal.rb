class ChangePictureType < ActiveRecord::Migration[5.1]
  def change
    change_column :members, :picture, :string
  end
end
