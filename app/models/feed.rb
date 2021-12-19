class Feed < ApplicationRecord
  belongs_to :profile, dependent: :delete_all
  has_many :requests
end
