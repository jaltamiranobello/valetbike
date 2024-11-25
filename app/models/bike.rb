class Bike < ApplicationRecord
  validates_presence_of    :identifier
  validates_uniqueness_of  :identifier
  
  belongs_to :current_station, class_name: :Station, foreign_key: :current_station_id, primary_key: :identifier,  optional: true
  , primary_key: :identifier
    def current_station
    Station.find_by(identifier: current_station_id)
  end
end
