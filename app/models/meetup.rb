class Meetup < Event
  extend Globalized

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

end
