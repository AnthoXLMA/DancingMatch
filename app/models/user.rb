class User < ApplicationRecord
  has_many :styles, through: :dances
  has_many :appointments
  has_many :partners, through: :appointments
end
