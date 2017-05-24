class AddUserToContacts < ActiveRecord::Migration
  def change
    add_reference :contacts, :user, index: true, foreign_key: true
  end
end
