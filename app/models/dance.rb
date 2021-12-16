class Dance < ApplicationRecord
  has_many :appointments
  has_many :users, through: :appointments
  has_many :profiles
  # belongs_to :profile
  # belongs_to :users
  validates :title, presence: true, uniqueness: true
  has_one_attached :photo
end
