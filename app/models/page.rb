class Page < ActiveRecord::Base
  extend Enumerize
  translates :title, :body

  validates :title, presence: true
  validates :state, presence: true

  enumerize :state, in: [:draft, :published, :archived], default: :draft

  scope :published, -> { where(state: "published") }
end
