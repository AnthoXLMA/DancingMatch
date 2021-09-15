class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar

  has_many :dance_id
  has_many :dances
  has_many :appointments
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
