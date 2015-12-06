# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  type       :string(255)      not null
#  starts_at  :datetime         not null
#  created_at :datetime
#  updated_at :datetime
#

class Event < ActiveRecord::Base
  translates :title, :body
  belongs_to :location
  # suggestion from Nicholas
  to_param :title

  validates :title, presence: true
  validates :starts_at, presence: true
  validates :body, presence: true

  def self.published
    order(starts_at: :desc)
  end

  def location
    super || TBALocation.new
  end

  def title_with_date
    return nil if starts_at.blank?
    [title, date].join(' : ')
  end

  def date
    starts_at.strftime("%B %d")
  end

  #To change the behaviour in /admin/events/1/edit...
  # driven by views/fields/enum_field/_show.html.erb
  def to_s
    title_with_date
  end

end
