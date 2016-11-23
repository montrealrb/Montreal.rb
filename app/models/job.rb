class Job < ActiveRecord::Base
  extend Enumerize
  STATES = %w(draft published archived).freeze

  belongs_to :organization
  belongs_to :author, foreign_key: :user_id, class_name: "User"

  scope :published, -> { where(state: :published).order(created_at: :desc) }

  enumerize :state, in: STATES, default: :draft

  validates :title,
            presence: true,
            length: { maximum: MAX_STRING_COLUMN_LENGTH }
  validates :description,
            presence: true,
            length: { maximum: MAX_TEXT_COLUMN_LENGTH }
  validates :state,
            presence: true,
            inclusion: { in: STATES }
  validates :author, presence: true

  def tweet
    TweetModelService.new(self).tweet("Check out the new job posting: #{title}") if persisted? && state == "published"
  end
end
