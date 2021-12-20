class Review < ApplicationRecord
  belongs_to :user

  validates_associated :content, presence: :true
end
