class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :omniauthable, :validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # belongs_to :dance

  has_one :profile

  has_many :messages, through: :chatrooms
  has_many :appointments
  has_many :dances, through: :appointments
  has_many :partners, through: :dances

  has_one_attached :photo

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :first_name, presence: true
  validates_confirmation_of :password
end
