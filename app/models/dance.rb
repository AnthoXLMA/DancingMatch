class Dance < ApplicationRecord
  has_many :dancers, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
