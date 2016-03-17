class HabtmRelationshipBetweenMembersAndOrganization < ActiveRecord::Migration
  def change
    create_table :members_organizations do |t|
      t.belongs_to :organization,  index: true
      t.belongs_to :member,        index: true
    end
  end
end
