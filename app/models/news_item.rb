class NewsItem < ActiveRecord::Base
  extend Enumerize
  enumerize :state, in: [:draft, :archived, :published]
  validates :published_at, presence: true, if: lambda{ state.published? } 
  validates_presence_of :title, :state

  def self.published
    where(state: "published").order(:published_at)
  end
end
