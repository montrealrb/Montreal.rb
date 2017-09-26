# frozen_string_literal: true

class Page < ActiveRecord::Base
  extend Enumerize
  extend FriendlyId

  translates :title, :body
  friendly_id :title, use: %i(slugged history)

  # Static Class Variables
  STATES = %i(draft published archived).freeze

  validates :title, presence: true
  validates :state, presence: true

  # Class methods
  enumerize :state, in: STATES, default: :draft

  scope :published, -> { where(state: "published") }

  private

  def should_generate_new_friendly_id?
    slug.blank? || changed.include?("title")
  end
end
