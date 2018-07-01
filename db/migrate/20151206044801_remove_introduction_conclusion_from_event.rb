class RemoveIntroductionConclusionFromEvent < ActiveRecord::Migration[5.1]
  def change
    remove_column :event_translations, :introduction, :text
    remove_column :event_translations, :conclusion, :text
  end
end
