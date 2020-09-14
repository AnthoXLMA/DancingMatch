class User < ApplicationRecord
  has_many :dances
  has_many :appointments
  has_many :partners, through: :appointments
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
end
