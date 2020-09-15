class Dance < ApplicationRecord
  has_many :partners
  has_many :appointments

  has_many :user, through: :appointments
end
