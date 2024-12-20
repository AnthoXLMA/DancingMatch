class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :dance
  has_one_attached :pic
  has_many :subscriptions

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  ADDRESS        = [Geocoder.search(:address)]

  validates :name, presence: true, uniqueness: false
end
