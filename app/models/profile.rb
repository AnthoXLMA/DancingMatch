class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar

  has_many :dance_id
end
