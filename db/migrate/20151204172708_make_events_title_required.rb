class MakeEventsTitleRequired < ActiveRecord::Migration
  def change
    change_column :event_translations, :title, :string, null: false
  end
end
