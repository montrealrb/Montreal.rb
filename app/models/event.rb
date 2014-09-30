class Event < ActiveRecord::Base
  belongs_to :location

  def self.published
    order(starts_at: :desc)
  end

end
