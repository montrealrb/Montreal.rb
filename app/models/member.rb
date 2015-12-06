class Member < ActiveRecord::Base
  has_many :events
  has_many :organizations
  belongs_to :user

  validates :name, :email, presence: true
  validates :email, uniqueness: true
end
