# frozen_string_literal: true

require "administrate/base_dashboard"

class NewsItemDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    # translations: Field::HasMany.with_options(class_name: "NewsItem::Translation"),
    title: Field::String,
    slug: Field::String,
    body: MarkdownField,
    state: EnumField,
    author: Field::BelongsTo.with_options(class_name: "User"),
    published_at: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i(
    title
    state
    published_at
  ).freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i(
    title
    body
    state
    published_at
  ).freeze

  # Overwrite this method to customize how news items are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(news_item)
  #   "NewsItem ##{news_item.id}"
  # end
end
