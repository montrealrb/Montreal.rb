class NewsItem < ActiveRecord::Base
  extend Enumerize
  AVAILABLE_STATES = %w(draft archived published)
  enumerize :state, in: AVAILABLE_STATES
  scope :published, -> { where(state: :published).order(:published_at) }
  validates :published_at, presence: true, if: -> { state.try(:published?) }
  validates :title, presence: true, length: {maximum: 255}
  validates :state, presence: true, inclusion: {in: AVAILABLE_STATES, message: "must be one of the following: #{AVAILABLE_STATES.join(', ')}"}
  validates :body, presence: true, length: {maximum: 4000}
end
