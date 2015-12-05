# a NewsItem represents any announcement that we want to communicate to our
# web audience.
#
# When it is marked as `published`, a `published_at` is automatically added/updated
# and will decide on the display order of that `news_item`
#
# NOTE: [legacy]
# - This is also where we imported the old wordpress posts
# - The `slug` is purely used to store the old wordpress slug and make sure we
#   can still resolve: http://www.montrealrb.com/[post_date:YYYY]/[post_date:MM]/[post_name]
#
class NewsItem < ActiveRecord::Base
  # Extends
  extend Enumerize

  # Scopes
  scope :published, -> { where(state: :published).order(published_at: :desc) }

  # Validations
  validates :published_at, presence: true, if: -> { state.try(:published?) }
  validates :title, presence: true, length: {maximum: 255}
  validates :state, presence: true, inclusion: { in: AVAILABLE_STATES }
  validates :body, presence: true, length: {maximum: 4000}

  # Class methods
  AVAILABLE_STATES = %w(draft archived published)
  enumerize :state, in: AVAILABLE_STATES
  to_param :title

  # Instance methods
end
