class Member < ActiveRecord::Base
  has_and_belongs_to_many :events
  has_and_belongs_to_many :organizations
  belongs_to :user

  validates :name, :email, presence: true
  validates :email, uniqueness: true
end
