class Appointment < ApplicationRecord
belongs_to :users
belongs_to :dances
# has_many :partners, dependent: :destroy
# # has_many :users
# # has_many :appointments
validates :name, presence: false, uniqueness: false
end
