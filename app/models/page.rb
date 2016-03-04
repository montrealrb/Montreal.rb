class Page < ActiveRecord::Base
  extend Enumerize

  translates :title, :body

  # Static Class Variables
  STATES = %w(draft published archived).freeze

  validates :title, presence: true
  validates :state, presence: true

  # Class methods
  enumerize :state, in: STATES, default: :draft

  scope :published, -> { where(state: "published") }
end
