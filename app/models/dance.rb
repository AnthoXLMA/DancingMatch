class Dance < ApplicationRecord
  # belongs_to :user

  has_many :partners, through: :appointments
end
