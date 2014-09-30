class Company < ActiveRecord::Base
  translates :description
  has_attached_file :logo

  validates :name, uniqueness: true, presence: true
end
