class AddStateToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :state, :string, default: "proposed"
  end
end
