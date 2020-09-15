class Dance < ApplicationRecord
  belongs_to :user

  has_many :users, through: :appointments
end
