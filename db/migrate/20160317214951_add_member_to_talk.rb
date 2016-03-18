class AddMemberToTalk < ActiveRecord::Migration
  def change
    add_reference :talks, :member, index: true
  end
end
