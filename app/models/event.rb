class Event < ActiveRecord::Base
  extend Enumerize
  STATES = %w(proposed scheduled).freeze

  translates :title, :introduction, :conclusion
  belongs_to :location
  belongs_to :author, foreign_key: :user_id, class_name: "User"

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

  def title_with_date
    date = starts_at.strftime("%B %d")
    [title, date].join(" : ")
  end

  def date
    starts_at.strftime("%B %d")
  end

  # driven by views/fields/enum_field/_show.html.erb
  def to_s
    title_with_date
  end
end
