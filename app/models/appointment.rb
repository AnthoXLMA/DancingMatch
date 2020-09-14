class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :partner
  # has_many :user
  # has_many :partner
end
