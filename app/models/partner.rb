class Partner < ApplicationRecord
  has_many :styles, through: :dances
  has_many :appointments
  has_many :users, through: :appointments
end
