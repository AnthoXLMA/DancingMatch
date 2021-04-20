class Appointment < ApplicationRecord
belongs_to :user
belongs_to :dance

validates :name, presence: true, uniqueness: false
end
