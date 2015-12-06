class AddNullConstraintToEmail < ActiveRecord::Migration
  def change
    change_column_null :members, :email, false
  end
end
