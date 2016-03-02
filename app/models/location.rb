class Location < ActiveRecord::Base
  translates :description, :directions

  has_many :events

  validates :name, presence: true
end
