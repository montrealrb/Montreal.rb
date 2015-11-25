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

  def self.published
    order(starts_at: :desc)
  end

  def location
    super || TBALocation.new
  end

  def title_with_date
    date = starts_at.strftime("%B %d")
    [title, date].join(' : ')
  end
end
