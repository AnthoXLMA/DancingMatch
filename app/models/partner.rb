class Partner < ApplicationRecord
  belongs_to :dance
  has_many :dances
  has_many :appointments
  has_many :users, through: :appointments

  has_one_attached :profile_pic
  geocoded_by :location
  # after_validation :geocode, if: :will_save_change_to_address?
end
