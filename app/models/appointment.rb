class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :dance

  has_one_attached :pic

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, presence: true, uniqueness: false
end
