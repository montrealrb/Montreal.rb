class Job < ActiveRecord::Base
  extend Enumerize
  STATES = %w(draft published archived)
  enumerize :state, in: STATES
  belongs_to :organization
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
