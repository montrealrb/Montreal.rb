# frozen_string_literal: true
require "administrate/base_dashboard"

class MeetupDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    location: Field::BelongsTo,
    translations: Field::HasMany.with_options(class_name: "Meetup::Translation"),
    id: Field::Number,
    type: Field::String,
    starts_at: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :location,
    :translations,
    :id,
    :type
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :location,
    :translations,
    :type,
    :starts_at
  ].freeze

  # Overwrite this method to customize how meetups are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(meetup)
  #   "Meetup ##{meetup.id}"
  # end
end
