# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  type       :string(255)      not null
#  starts_at  :datetime         not null
#  created_at :datetime
#  updated_at :datetime
#

class Event < ActiveRecord::Base
  belongs_to :location
  has_many :members

  def self.published
    order(starts_at: :desc)
  end

  def location
    super || TBALocation.new
  end

end
