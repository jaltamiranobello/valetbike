class Trip < ApplicationRecord
    # validates_presence_of   :identifier
    # validates_uniqueness_of :identifier
    validates_presence_of  :bike_used_id,
                           :start_station_id,
                           :user_id
                          

    belongs_to :start_station, class_name: :Station, foreign_key: :start_station_id, primary_key: :identifier, optional: false
    belongs_to :end_station, class_name: :Station, foreign_key: :end_station_id, primary_key: :identifier, optional: true
    belongs_to :bike_used, class_name: :Bike, foreign_key: :bike_used_id, primary_key: :identifier, optional: false
    belongs_to :user, class_name: :User, foreign_key: :user_id, primary_key: :id, optional: false
    
    before_create :set_identifier

    private

    def set_identifier
        self.identifier = self.bike_used.identifier if self.bike_used
    end
end