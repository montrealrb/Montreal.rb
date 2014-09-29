class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :type
      t.datetime :starts_at
      t.timestamps
    end
    Meetup.create_translation_table! :title => :string, :introduction => :text, :conclusion => :text
  end
end
