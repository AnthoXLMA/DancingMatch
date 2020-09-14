class Partner < ApplicationRecord
  has_many :dances
  has_many :appointments
  has_many :users, through: :appointments
end
