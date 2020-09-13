class Dance < ApplicationRecord
  belongs_to :style
  has_many :users
  has_many :partners
end
