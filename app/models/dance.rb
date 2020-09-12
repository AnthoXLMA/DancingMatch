class Dance < ApplicationRecord
  has_many :dancers
  validates :name, presence: true, uniqueness: true
end
