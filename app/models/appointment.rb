class Appointment < ApplicationRecord
belongs_to :users
belongs_to :dances

validates :name, presence: false, uniqueness: false
end
