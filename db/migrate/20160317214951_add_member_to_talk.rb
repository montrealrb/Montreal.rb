class AddMemberToTalk < ActiveRecord::Migration[5.1]
  def change
    add_reference :talks, :member, index: true
  end
end
