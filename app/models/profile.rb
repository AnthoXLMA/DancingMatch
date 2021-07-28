class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar

  has many :dance_id
end
