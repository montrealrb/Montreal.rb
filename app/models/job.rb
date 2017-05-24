# frozen_string_literal: true
class Job < ActiveRecord::Base
  extend Enumerize
  include Authorable
  STATES = %w(draft published archived).freeze

  belongs_to :organization

  scope :published, -> { where(state: :published).order(created_at: :desc) }

  enumerize :state, in: STATES, default: :draft

  validates :title,
            presence: true,
            length: { maximum: MAX_STRING_COLUMN_LENGTH }
  validates :description,
            presence: true,
            length: { maximum: MAX_TEXT_COLUMN_LENGTH }
  validates :state,
            presence: true,
            inclusion: { in: STATES }
end
