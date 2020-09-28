class Partner < ApplicationRecord
  belongs_to :dance
  has_many :dances
  has_many :appointments
  has_many :users, through: :appointments

  geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
end
