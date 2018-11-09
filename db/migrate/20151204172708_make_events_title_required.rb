class MakeEventsTitleRequired < ActiveRecord::Migration[5.1]
  def change
    change_column :event_translations, :title, :string, null: false
  end
end
