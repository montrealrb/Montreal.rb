class Organization < ActiveRecord::Base
  has_many :jobs
  translates :description
  mount_uploader :logo, LogoUploader

  validates :name, uniqueness: true, presence: true
end
