class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :trip_history, class_name: :Trip, foreign_key: :user_id, primary_key: :identifier
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
