class Event < ActiveRecord::Base
  extend Enumerize
  STATES = %w(proposed scheduled).freeze

  translates :title, :body

  belongs_to :location
  belongs_to :author, foreign_key: :user_id, class_name: "User"
  has_many   :talks, -> { where(state: "scheduled") }, class_name: "Talk"
  has_many   :sponsorships
  has_many   :sponsors, through: :sponsorships, source: :organization
  has_and_belongs_to_many :members

  to_param :title

  validates :title, presence: true
  validates :starts_at, presence: true
  validates :location, presence: true
  validates :author, presence: true
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

  private

  def title_with_date
    [title, start_date_string].join(" : ")
  end

  def start_date_string
    starts_at.strftime("%B %d")
  end
end
