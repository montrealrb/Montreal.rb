class Organization < ActiveRecord::Base
  has_many :jobs
  has_and_belongs_to_many :jobs

  translates :description
  mount_uploader :logo, LogoUploader

  has_many   :event_sponsors
  has_many   :events, through: :event_sponsors

  validates :name, uniqueness: true, presence: true
end
