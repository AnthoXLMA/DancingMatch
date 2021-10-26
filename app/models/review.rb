class Review < ApplicationRecord
  belongs_to :user
  # validates :content, :length { minimum: 20}
  validates :content, presence: :true
end
