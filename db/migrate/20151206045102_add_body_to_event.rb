class AddBodyToEvent < ActiveRecord::Migration[5.1]
  def up
    Event.add_translation_fields! body: :text
  end

  def down
    remove_column :event_translations, :body
  end
end
