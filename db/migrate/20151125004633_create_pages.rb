class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title, null: false
      t.text :body
      t.string :state, null:false

      t.timestamps null: false
    end
  end
end
