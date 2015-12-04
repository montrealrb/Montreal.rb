class Location < ActiveRecord::Base
  translates :description, :directions

  validates :name, presence: true
end

class TBALocation
  def name
    'TBA'
  end

  def address
    'TBA'
  end

  def directions
    ''
  end

  def description
    ''
  end

  def url
    ''
  end

end
