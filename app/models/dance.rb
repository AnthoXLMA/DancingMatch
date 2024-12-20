class Dance < ApplicationRecord
<<<<<<< HEAD
# belongs_to :user
# belongs_to :partner
has_many :partners
has_many :users
has_many :appointments

validates :title, presence: true
=======
  has_many :appointments
  has_many :users, through: :appointments
  has_many :profiles
  # belongs_to :users
  validates :title, presence: true
  has_one_attached :photo
>>>>>>> 87642039e64e140e485442c7f940c8ace596168f
end
