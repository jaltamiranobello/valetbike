class Bike < ApplicationRecord
  validates_presence_of    :identifier
  validates_uniqueness_of  :identifier
  
  belongs_to :current_station, class_name: :Station, foreign_key: :current_station_id, optional: true
  has_many :trips_taken, class_name: :Trip, foreign_key: :bike_used_id
end
