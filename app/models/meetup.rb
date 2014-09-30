class Meetup < Event
  extend Globalized

  class NotScheduledYet

    def starts_at
      date = third_tuesday_of(Time.now)
      return third_tuesday_of(date.next_month) if date.end_of_day <= Time.now
      date
    end

    private

    def third_tuesday_of(time)
      date = time.beginning_of_month.to_date
      date = date.succ until date.tuesday?
      (date + 2.weeks).to_time + 20.hours
    end

  end

  translates :title, :introduction, :conclusion
  globalize_accessors locales: I18n.available_locales, attributes: %i(title introduction conclusion)
  validates_translated :title, :introduction, :conclusion, presence: true

  rails_admin do
    list do
      field :title_en
      field :starts_at
    end

    edit do
      field :starts_at
      Meetup.translated_fields(:title, :introduction, :conclusion).each do |accessor|
        field accessor
      end
    end
  end

  def self.next
    order(starts_at: :asc).where('starts_at > ?', Time.now).first || NotScheduledYet.new
  end

end
