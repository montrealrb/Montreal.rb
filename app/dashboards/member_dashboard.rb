# frozen_string_literal: true

require "administrate/base_dashboard"

class MemberDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id:             Field::Number,
    events:         Field::HasMany,
    organizations:  Field::HasMany,
    user:           Field::BelongsTo,
    name:           Field::String,
    email:          Field::String,
    picture:        Field::String,
    twitter_handle: Field::String,
    github_handle:  Field::String,
    website:        Field::String,
    company:        Field::String,
    biography:      MarkdownField,
    created_at:     Field::DateTime,
    updated_at:     Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i(
    id
    user
    name
  ).freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i(
    user
    name
    company
    email
    picture
    twitter_handle
    github_handle
    website
    biography
    organizations
    events
  ).freeze

  # Overwrite this method to customize how members are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(member)
    member.name
  end
end
