class Page < ActiveRecord::Base
  extend Enumerize

  enumerize :state, in: [:draft, :published, :archived], default: :draft
end
