# frozen_string_literal: true

class Location < ActiveRecord::Base
  translates :description, :directions
  # Someday, we should be able to remove those lines
  attribute :description
  attribute :directions

  has_many :events

  validates :name, presence: true
end
