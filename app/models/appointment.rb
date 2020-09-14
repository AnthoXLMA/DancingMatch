class Appointment < ApplicationRecord
  has_many :user
  has_many :partner
  has_one :dance
end
