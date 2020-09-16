class Partner < ApplicationRecord
  # has_one :dances
  has_many :appointments
  has_many :users, through: :appointments
end
