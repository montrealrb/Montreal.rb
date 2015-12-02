class NewsItem < ActiveRecord::Base
  extend Enumerize
  enumerize :state, in: [:draft, :archived, :published]
  scope :published, -> { where(state: :published).order(:published_at) }
  validates :published_at, presence: true, if: lambda{ state.published? } 
  validates_presence_of :title, :state
end
