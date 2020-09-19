class Partner < ApplicationRecord
  belongs_to :dance

  has_many :appointments
  has_many :users, through: :appointments
end
