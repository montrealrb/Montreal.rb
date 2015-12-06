class AddBodyToEvent < ActiveRecord::Migration
  def up
    Event.add_translation_fields! body: :text
  end

  def down
    remove_column :event_translations, :body
  end
end
