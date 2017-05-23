# frozen_string_literal: true
class Contact < ActiveRecord::Base
  belongs_to :organization
  belongs_to :author, foreign_key: :user_id, class_name: "User"

  validates :name, :email, :author, presence: true
  validates :email, uniqueness: true
end
