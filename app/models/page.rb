class Page < ActiveRecord::Base
  extend Enumerize

  enumerize :state, in: [:draft, :published, :archived], default: :draft

  scope :published, -> { where(state: 'published') }
end
