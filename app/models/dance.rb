class Dance < ApplicationRecord
has_many :appointments
# has_many :profiles, through: :appointments
belongs_to :profile
# has_many :partners, dependent: :destroy
validates :title, presence: true, uniqueness: true
end
