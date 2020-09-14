class Dance < ApplicationRecord
  has_many :partners
  has_many :users
end
