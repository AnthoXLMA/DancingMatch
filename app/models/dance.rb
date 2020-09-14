class Dance < ApplicationRecord
  has_many :users
  has_many :partners
end
