class Talk < ActiveRecord::Base
  extend Enumerize
  STATES = [:proposed, :scheduled, :presented].freeze

  translates :title, :description
  belongs_to :event

  validates :title, presence: true
  validates :event, presence: true

  enumerize :state, in: STATES
  enumerize :level, in: [:beginner, :intermediate, :advanced]
end
