class AddUserToContacts < ActiveRecord::Migration[5.1]
  def change
    add_reference :contacts, :user, index: true, foreign_key: true
  end
end
