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
  translates :title, :introduction, :conclusion
  belongs_to :location
  has_many :talks
  # suggestion from Nicholas
  to_param :title

  validates :title, presence: true
  validates :starts_at, presence: true
  validates :location, presence: true

  def self.published
    order(starts_at: :desc)
  end

  def title_with_date
    date = starts_at.strftime("%B %d")
    [title, date].join(' : ')
  end

  #To change the behaviour in /admin/events/1/edit...
  # driven by views/fields/enum_field/_show.html.erb
  def to_s
    title_with_date
  end
end
