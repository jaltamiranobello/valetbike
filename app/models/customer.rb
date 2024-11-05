class Customer < ApplicationRecord
    EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

    validates_presence_of   :identifier,
                            :firstName,
                            :lastName,
                            :email,
                            :password
    validates_uniqueness_of :identifier,
                            :email 
    validates :email, presence: true,
                    length: { maximum: 100 },
										uniqueness: true,
                    format: { with: EMAIL_REGEX },
                    confirmation: true
end
