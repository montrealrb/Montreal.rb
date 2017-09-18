# frozen_string_literal: true

class Sponsorship < ActiveRecord::Base
  belongs_to :event, counter_cache: true
  belongs_to :organization

  validates :event, presence: true
  validates :organization, presence: true
end
