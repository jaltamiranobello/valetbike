class Trip < ApplicationRecord
    validates_presence_of   :identifier
    validates_uniqueness_of :identifier

    belongs_to :start_station, class_name: :Station, foreign_key: :start_station_id, primary_key: :identifier, optional: false
    belongs_to :end_station, class_name: :Station, foreign_key: :end_station_id, primary_key: :identifier, optional: true
    belongs_to :bike_used, class_name: :Bike, foreign_key: :bike_used_id, primary_key: :identifier, optional: false
    belongs_to :user, class_name: :User, foreign_key: :user_id, primary_key: :id, optional: false
    belongs_to :card, class_name: :Card, foreign_key: :card_id, primary_key: :id, optional: false

end