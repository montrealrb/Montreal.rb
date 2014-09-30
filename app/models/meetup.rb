class Meetup < Event
  translates :title, :introduction, :conclusion
  globalize_accessors locales: %i(en fr), attributes: %i(title introduction conclusion)

  validates :title_en, :title_fr, :introduction_en, :introduction_fr, :conclusion_en, :conclusion_fr, presence: true

  rails_admin do
    list do
      field :title_en
      field :starts_at
    end

    edit do
      field :starts_at
      field :title_en
      field :title_fr
      field :introduction_en
      field :introduction_fr
      field :conclusion_en
      field :conclusion_fr
    end
  end

end
