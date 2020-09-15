class Dance < ApplicationRecord
  # belongs_to :user
  has_many :users, through: :appointments
  has_many :partners, through: :appointments
end
