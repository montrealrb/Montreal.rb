# frozen_string_literal: true
class Talk < ActiveRecord::Base
  extend Enumerize
  STATES  = [:proposed, :scheduled, :presented].freeze
  FORMATS = [:full, :half, :lightning].freeze
  LEVELS  = [:beginner, :intermediate, :advanced].freeze

  translates :title, :description
  belongs_to :event, counter_cache: true, inverse_of: :talks
  belongs_to :member

  validates :title,  presence: true
  validates :member, presence: true

  enumerize :state,  in: STATES
  enumerize :format, in: FORMATS
  enumerize :level,  in: LEVELS
end
