class Talk < ActiveRecord::Base
  extend Enumerize

  translates :title, :description
  belongs_to :event

  validates :title, presence: true
  validates :event, presence: true

  enumerize :state, in: [:proposed, :scheduled, :presented]
  enumerize :level, in: [:beginner, :intermediate, :advanced]
end
