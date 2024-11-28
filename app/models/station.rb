class Station < ApplicationRecord

  validates_presence_of    :identifier,
                           :name,
                           :address
  validates_uniqueness_of  :identifier
  
  has_many :docked_bikes, class_name: :Bike, foreign_key: :current_station_id, primary_key: :identifier
  has_many :started_trips, class_name: :Trip, foreign_key: :start_station_id
  has_many :ended_trips, class_name: :Trip, foreign_key: :end_station_id
  
end
