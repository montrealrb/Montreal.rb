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
  extend FriendlyId
  friendly_id :title, use: :slugged

  translates :title, :introduction, :conclusion
  belongs_to :location

  validates_presence_of :title, :starts_at
  validates_uniqueness_of :title

  def self.published
    order(starts_at: :desc)
  end

  def location
    super || TBALocation.new
  end



end
