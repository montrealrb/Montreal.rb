class AddNullConstraintToEmail < ActiveRecord::Migration[5.1]
  def change
    change_column_null :members, :email, false
  end
end
