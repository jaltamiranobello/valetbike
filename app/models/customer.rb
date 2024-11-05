class Customer < ApplicationRecord
    # email format -- not tested yet 
    EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

    # ensures that the Customer has each of these data points 
    validates_presence_of   :identifier,
                            :firstName,
                            :lastName,
                            :email,
                            :password
    # ensures that a customer cannot register if email already exists in database 
    validates_uniqueness_of :identifier,
                            :email 
    # ensures that the email is in the correct format -- not tested yet
    validates :email, presence: true,
                    length: { maximum: 100 },
										uniqueness: true,
                    format: { with: EMAIL_REGEX },
                    confirmation: true
end
