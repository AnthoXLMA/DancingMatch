class Request < ApplicationRecord
  belongs_to :user
  # belongs_to :profile, dependent: :destroy
end
