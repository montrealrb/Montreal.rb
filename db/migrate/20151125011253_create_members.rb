class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :email
      t.binary :picture
      t.string :twitter_handle
      t.string :github_handle
      t.text :biography

      t.timestamps null: false
    end
  end
end
