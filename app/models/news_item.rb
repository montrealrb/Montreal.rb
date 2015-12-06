class NewsItem < ActiveRecord::Base
  extend Enumerize
  STATES = %w(draft published archived)
  enumerize :state, in: STATES
  scope :published, -> { where(state: :published).order(:published_at) }
  validates :published_at,
            presence: true,
            if: -> { state.try(:published?) }
  validates :title,
            presence: true,
            length: { maximum: MAX_STRING_COLUMN_LENGTH }
  validates :body,
            presence: true,
            length: { maximum: MAX_TEXT_COLUMN_LENGTH }
  validates :state,
            presence: true,
            inclusion: { in: STATES }
end
