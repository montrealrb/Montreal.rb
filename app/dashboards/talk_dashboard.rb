require "administrate/base_dashboard"

class TalkDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    votes: Field::HasMany,
    author: Field::BelongsTo.with_options(class_name: "User"),
    id: Field::Number,
    title: Field::String,
    description: Field::Text,
    bio: Field::Text,
    slides: Field::String,
    author_id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :votes,
    :author,
    :id,
    :title
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :votes,
    :author,
    :title,
    :description,
    :bio,
    :slides,
    :author_id
  ].freeze

  # Overwrite this method to customize how talks are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(talk)
  #   "Talk ##{talk.id}"
  # end
end
