# frozen_string_literal: true
class Job < ActiveRecord::Base
  extend Enumerize
  STATES = %w(draft published archived).freeze

  before_save :set_published_at, if: proc { state_changed?(to: "published") }

  belongs_to :organization
  belongs_to :author, foreign_key: :user_id, class_name: "User"

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
  validates :author, presence: true

  private

  def set_published_at
    self.published_at = DateTime.current
  end
end
