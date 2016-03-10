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

class Meetup < Event
  extend Globalized

  class NotScheduledYet
    def starts_at
      date = third_tuesday_of(Time.current)
      return third_tuesday_of(date.next_month) if date.end_of_day <= Time.current
      date
    end

    private

    def third_tuesday_of(time)
      date = time.beginning_of_month.to_date
      date = date.succ until date.tuesday?
      (date + 2.weeks).in_time_zone + 20.hours
    end
  end

  translates :title, :body
  globalize_accessors locales: I18n.available_locales, attributes: %i(title introduction conclusion)
  validates_translated :title, :introduction, :conclusion, presence: true

  def self.next
    order(starts_at: :asc).find_by("starts_at > ?", Time.now) || NotScheduledYet.new
  end
end
