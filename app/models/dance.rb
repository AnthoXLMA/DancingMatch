class Dance < ApplicationRecord
  belongs_to :partner
  has_many :appointments
end
