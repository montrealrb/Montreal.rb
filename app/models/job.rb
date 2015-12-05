class Job < ActiveRecord::Base
  extend Enumerize

  STATES = %w(draft published archived).freeze

  belongs_to :organization

  enumerize :state, in: STATES

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
