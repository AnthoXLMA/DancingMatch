class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_pic
  # belongs_to :dance
  has_many :dances
  has_many :appointments
  has_many :partners, through: :appointments
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_address?
  # validates :pseudo, presence: true
end
