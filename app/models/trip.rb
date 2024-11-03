class Trip < ApplicationRecord
    validates_presence_of   :identifier,
                            :start_time,
                            :end_time,
                            :start_staion,
                            :end_station,
                            :bike_used,
                            :customer
    validates_uniqueness_of :identifier

    belongs_to :start_station, class_name: :Station, foreign_key: :start_station_id, optional: false
    belongs_to :end_station, class_name: :Station, foreign_key: :end_station_id, optional: false
    belongs_to :bike_used, class_name: :Bike, foreign_key: :bike_used_id, optional: false
    belongs_to :customer, class_name: :Customer, foreign_key: :customer_id, optional: false
end
