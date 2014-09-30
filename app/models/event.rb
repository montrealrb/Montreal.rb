class Event < ActiveRecord::Base

  def self.published
    order(starts_at: :desc)
  end

end
