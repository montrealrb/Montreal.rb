class Sponsorship < ActiveRecord::Base
  belongs_to :event
  belongs_to :organization

  validates :event, presence: true
  validates :organization, presence: true
end
