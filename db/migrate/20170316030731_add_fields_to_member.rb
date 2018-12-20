# frozen_string_literal: true
class AddFieldsToMember < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :website, :string
    add_column :members, :company, :string
  end
end
