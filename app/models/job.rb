class Job < ActiveRecord::Base
  extend Enumerize
  STATUSES = [:draft, :published, :archived]
  enumerize :state, in: STATUSES
  belongs_to :organization
  belongs_to :published_by, foreign_key: :user_id, class_name: "User"

  validates :published_by, presence: true
end
