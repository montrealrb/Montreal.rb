class AddStateToEvents < ActiveRecord::Migration
  def change
    add_column :events, :state, :string, default: "proposed"
  end
end
