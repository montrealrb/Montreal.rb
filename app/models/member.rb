class Member < ActiveRecord::Base
  has_many :events
  has_many :organizations
  has_one :user

  validates :name, :email, presence: true
  validates :email, uniqueness: true
end
