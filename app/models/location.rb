class Location < ActiveRecord::Base
  translates :description, :directions

  validates :name, presence: true
end
