class DeleteTypeFromEvents < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :type, :string
  end
end
