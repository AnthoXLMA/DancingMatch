class Partner < ApplicationRecord
  belongs_to :dances

  has_many :appointments
  has_many :users, through: :appointments
end
