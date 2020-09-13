class Dance < ApplicationRecord
  has_one_attached :style
  has_many :users
  has_many :partners
end
