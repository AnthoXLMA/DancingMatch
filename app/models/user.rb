class User < ApplicationRecord
  has_many :appointments
  has_many :partners, through: :appointments

  validates :name, presence: true
end
