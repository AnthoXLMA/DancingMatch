class Partner < ApplicationRecord
  has_many :dances
  has_many :appointment
end
