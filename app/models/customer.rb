class Customer < ApplicationRecord
    has_many :trips_taken, class_name: :Trip, foreign_key: :customer_id
end