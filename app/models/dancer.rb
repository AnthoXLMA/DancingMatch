class Dancer < ApplicationRecord
  has_many :dances, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
