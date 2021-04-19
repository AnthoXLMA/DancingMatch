class Dance < ApplicationRecord
# belongs_to :user
# belongs_to :partner
has_many :appointments
has_many :users, through: :appointments

has_many :partners, dependent: :destroy
validates :title, presence: true, uniqueness: true
end
