class Organization < ActiveRecord::Base
  has_many :jobs
  has_and_belongs_to_many :jobs

  translates :description
  mount_uploader :logo, LogoUploader

  has_many :sponsorships
  has_many :sponsored_events, through: :sponsorships, source: :event

  validates :name, uniqueness: true, presence: true
end
