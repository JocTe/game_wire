class User < ApplicationRecord
  has_many :games, dependent: :destroy
  has_many :bookings
  has_one_attached :photo
  # has_many :games, through: :bookings

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
