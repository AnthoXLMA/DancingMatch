class Dance < ApplicationRecord

has_many :appointments
has_many :users, through: :appointments

# has_many :partners, dependent: :destroy
validates :title, presence: true, uniqueness: true
end
