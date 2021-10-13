class Profile < ApplicationRecord
  belongs_to :user

  validates_associated :user
  has_one_attached :avatar
  belongs_to :dance
  has_many :dances
  has_many :appointments

  DANCES = []
end
