# frozen_string_literal: true
class Talk < ActiveRecord::Base
  extend Enumerize
  STATES = [:proposed, :scheduled, :presented].freeze

  translates :title, :description
  belongs_to :event
  belongs_to :member

  validates :title,  presence: true
  validates :member, presence: true

  enumerize :state, in: STATES
  enumerize :level, in: [:beginner, :intermediate, :advanced]
end
