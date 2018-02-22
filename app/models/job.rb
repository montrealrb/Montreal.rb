# frozen_string_literal: true

class Job < ActiveRecord::Base
  extend Enumerize
  include Authorable
  STATES = %w(draft published archived).freeze

  before_save :set_published_at, if: proc { state_changed?(to: "published") }

  belongs_to :organization

  scope :published, -> { where(state: :published).order(created_at: :desc) }

  scope :search, (lambda do |query|
    if query.present?
      where(arel_table[:title].matches("%#{query}%").or(arel_table[:description].matches("%#{query}%")))
    else
      all
    end
  end)
  
  scope :draft, -> { where(state: :draft) }

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

  accepts_nested_attributes_for :organization

  private

  def set_published_at
    # We can't use touch since it only work on persisted object
    self.published_at = DateTime.current
  end
end
