class Location < ActiveRecord::Base
  translates :description, :directions
end
