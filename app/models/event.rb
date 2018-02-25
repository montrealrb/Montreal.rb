# frozen_string_literal: true

class Event < ActiveRecord::Base
  extend Enumerize
  include Authorable

  STATES = %w(proposed scheduled).freeze

  translates :title, :body
  # Someday, we should be able to remove those lines
  attribute :title
  attribute :body

  belongs_to :location
  has_many   :talks, -> { where(state: "scheduled") }, class_name: "Talk", inverse_of: :event
  has_many   :sponsorships
  has_many   :sponsors, through: :sponsorships, source: :organization
  has_and_belongs_to_many :members

  to_param :title

  validates :title, presence: true
  validates :starts_at, presence: true
  validates :location, presence: true
  validates :state,
            presence: true,
            inclusion: { in: STATES }
  validates :body, presence: true

  enumerize :state, in: STATES, default: :proposed

  scope :published, -> { where(state: "scheduled").order(starts_at: :desc) }

  # driven by views/fields/enum_field/_show.html.erb
  def to_s
    title_with_date
  end

  def tweet
    TweetEventService.new(self).call if persisted? && state == "scheduled"
  end

  def unlink_all_talks
    transaction do
      # Remove tasks event if and set them back to proposed
      talks.update_all(event_id: nil, state: "proposed")
      destroy
    end
    destroyed?
  end

  private

  def title_with_date
    [title, start_date_string].join(" : ")
  end

  def start_date_string
    starts_at.strftime("%B %d")
  end
end
