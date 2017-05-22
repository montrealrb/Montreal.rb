# frozen_string_literal: true
class Job < ActiveRecord::Base
  extend Enumerize
  STATES = %w(draft published archived).freeze

  belongs_to :organization
  belongs_to :author, foreign_key: :user_id, class_name: "User"

  scope :published, -> { where(state: :published).order(created_at: :desc) }
  scope :search, (lambda do |query|
    where("title LIKE ? OR description LIKE ?", "%#{query}%", "%#{query}%")
  end)

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
end
